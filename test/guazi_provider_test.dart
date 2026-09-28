import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:mekuru/core/error/result.dart';
import 'package:mekuru/features/comic/data/sources/guazi/guazi_auth_session.dart';
import 'package:mekuru/features/comic/data/sources/guazi/guazi_provider.dart';
import 'package:mekuru/core/network/api_client.dart';
import 'package:mekuru/features/logger/domain/services/app_logger_service.dart';
import 'package:mekuru/features/logger/domain/models/log_entry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MockAppLogger implements IAppLogger {
  @override
  void logApi(ApiLogEntry entry) {}
  @override
  void logSystemEvent(String eventType, Map<String, dynamic> data) {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    HttpOverrides.global = null;
    SharedPreferences.setMockInitialValues({});
  });

  group('GuaziAuthSession Tests', () {
    test('Should fetch and cache visitor token', () async {
      final session = GuaziAuthSession();
      final token = await session.getToken();
      expect(token, isNotEmpty);

      // Verify SharedPreferences has the token
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('guazi_visitor_token'), equals(token));

      // Second call should return the same token from cache
      final cachedToken = await session.getToken();
      expect(cachedToken, equals(token));
    });

    test('Concurrent getToken calls should only trigger one visitor login', () async {
      final session = GuaziAuthSession();
      final results = await Future.wait([
        session.getToken(),
        session.getToken(),
        session.getToken(),
      ]);

      expect(results[0], isNotEmpty);
      expect(results[0], equals(results[1]));
      expect(results[1], equals(results[2]));
    });
  });

  group('GuaziProvider Integration Tests', () {
    test('exploreComics should automatically acquire token and return decrypted list', () async {
      final container = ProviderContainer();
      final loggerProv = Provider<IAppLogger>((ref) => MockAppLogger());
      final apiClient = ApiClient(
        '',
        container.read(Provider<Ref>((ref) => ref)),
        loggerProv,
        dioOverride: Dio(),
      );

      final provider = GuaziProvider(apiClient);
      final result = await provider.exploreComics(1);
      if (result is Error) {
        print('exploreComics error: ${(result as Error).failure.message}');
      }
      expect(result, isA<Success>());
      final success = result as Success;
      expect(success.value.items, isNotEmpty);
      
      final firstComic = success.value.items.first;
      print('First comic title: ${firstComic.title}');
      expect(firstComic.title, isNotEmpty);
      // Verify title is not base64 ciphertext
      expect(firstComic.title.contains('=='), isFalse);
    });

    test('Should auto-recover when initial token is expired (10002)', () async {
      final expiredToken = 'eyJ1aWQiOiIyODMzNSIsInRpbWUiOjE3ODc2ODA0OTUsInNpZ24iOiJiOWIwZmNhMGEzMDdkMmE1NDU4YzhhMGExOTQ2NmM2YyJ9';
      
      // Seed expired token in SharedPreferences
      SharedPreferences.setMockInitialValues({
        'guazi_visitor_token': expiredToken,
      });

      final container = ProviderContainer();
      final loggerProv = Provider<IAppLogger>((ref) => MockAppLogger());
      final apiClient = ApiClient(
        '',
        container.read(Provider<Ref>((ref) => ref)),
        loggerProv,
        dioOverride: Dio(),
      );

      final provider = GuaziProvider(apiClient);
      
      // Request exploreComics. The interceptor should receive 10002 with expired token,
      // forceRefresh a new token, retry, and succeed!
      final result = await provider.exploreComics(1);

      expect(result, isA<Success>());
      final success = result as Success;
      expect(success.value.items, isNotEmpty);
      print('Auto-recovered successfully! First comic: ${success.value.items.first.title}');

      // Verify the new token has been saved in SharedPreferences, overwriting the expired one
      final prefs = await SharedPreferences.getInstance();
      final currentToken = prefs.getString('guazi_visitor_token');
      expect(currentToken, isNot(equals(expiredToken)));
    });

    test('Full reading pipeline: search -> detail -> chapters -> images', () async {
      final container = ProviderContainer();
      final loggerProv = Provider<IAppLogger>((ref) => MockAppLogger());
      final apiClient = ApiClient(
        '',
        container.read(Provider<Ref>((ref) => ref)),
        loggerProv,
        dioOverride: Dio(),
      );

      final provider = GuaziProvider(apiClient);

      // 1. Search
      final searchResult = await provider.searchComics('武', 1);
      expect(searchResult, isA<Success>());
      final comics = (searchResult as Success).value.items;
      expect(comics, isNotEmpty);
      final testComic = comics.first;
      print('Searched comic: ${testComic.title} (id: ${testComic.comicId})');

      // 2. Detail
      final detailResult = await provider.getComicDetail(testComic.comicId);
      expect(detailResult, isA<Success>());
      final detail = (detailResult as Success).value;
      print('Comic detail title: ${detail.title}, author: ${detail.author}');
      expect(detail.title, isNotEmpty);

      // 3. Chapters
      final chaptersResult = await provider.getChapterList(testComic.comicId);
      expect(chaptersResult, isA<Success>());
      final chapters = (chaptersResult as Success).value;
      expect(chapters, isNotEmpty);
      final firstChapter = chapters.first;
      print('First chapter: ${firstChapter.title} (id: ${firstChapter.id})');
      expect(firstChapter.title, isNotEmpty);

      // 4. Chapter Images
      final imagesResult = await provider.getChapterImages(testComic.comicId, firstChapter.id);
      expect(imagesResult, isA<Success>());
      final pages = (imagesResult as Success).value;
      expect(pages, isNotEmpty);
      print('First chapter pages count: ${pages.length}, first image URL: ${pages.first.imageUrl}');
      expect(pages.first.imageUrl, startsWith('http'));
    });
  });
}
