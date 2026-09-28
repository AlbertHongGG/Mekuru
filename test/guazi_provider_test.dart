import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:mekuru/core/error/result.dart';
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

  group('GuaziProvider Integration Tests', () {
    test('exploreComics should acquire token and return decrypted comics list', () async {
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
      expect(result, isA<Success>());
      final success = result as Success;
      expect(success.value.items, isNotEmpty);

      final firstComic = success.value.items.first;
      expect(firstComic.title, isNotEmpty);
      // Verify title is decrypted, not base64 ciphertext
      expect(firstComic.title.contains('=='), isFalse);
    });

    test('Should auto-recover when initial token is expired (10002)', () async {
      const expiredToken =
          'eyJ1aWQiOiIyODMzNSIsInRpbWUiOjE3ODc2ODA0OTUsInNpZ24iOiJiOWIwZmNhMGEzMDdkMmE1NDU4YzhhMGExOTQ2NmM2YyJ9';

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

      // Request exploreComics: interceptor encounters 10002, auto-refreshes token, retries, and succeeds
      final result = await provider.exploreComics(1);

      expect(result, isA<Success>());
      final success = result as Success;
      expect(success.value.items, isNotEmpty);

      // Verify the new token has overwritten the expired one
      final prefs = await SharedPreferences.getInstance();
      final currentToken = prefs.getString('guazi_visitor_token');
      expect(currentToken, isNot(equals(expiredToken)));
    });

    test('Should auto-recover when token mismatch / logged in elsewhere occurs (10010)', () async {
      // Token from HAR entry 94 that triggers error_code 10010
      const mismatchToken =
          'eyJ1aWQiOiIyODMzNSIsInRpbWUiOjE3OTA2MDE5NTYsInNpZ24iOiI5ZTVmYjZkMDFhM2E4MTI2M2I1YTJmZDc1NjNiN2FiYiJ9';

      SharedPreferences.setMockInitialValues({
        'guazi_visitor_token': mismatchToken,
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

      // Request exploreComics: interceptor encounters 10010, auto-refreshes token, retries, and succeeds
      final result = await provider.exploreComics(1);

      expect(result, isA<Success>());
      final success = result as Success;
      expect(success.value.items, isNotEmpty);

      // Verify the new token has replaced the mismatched one
      final prefs = await SharedPreferences.getInstance();
      final currentToken = prefs.getString('guazi_visitor_token');
      expect(currentToken, isNot(equals(mismatchToken)));
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

      // 2. Detail
      final detailResult = await provider.getComicDetail(testComic.comicId);
      expect(detailResult, isA<Success>());
      final detail = (detailResult as Success).value;
      expect(detail.title, isNotEmpty);

      // 3. Chapters
      final chaptersResult = await provider.getChapterList(testComic.comicId);
      expect(chaptersResult, isA<Success>());
      final chapters = (chaptersResult as Success).value;
      expect(chapters, isNotEmpty);
      final firstChapter = chapters.first;
      expect(firstChapter.title, isNotEmpty);

      // 4. Chapter Images
      final imagesResult =
          await provider.getChapterImages(testComic.comicId, firstChapter.id);
      expect(imagesResult, isA<Success>());
      final pages = (imagesResult as Success).value;
      expect(pages, isNotEmpty);
      expect(pages.first.imageUrl, startsWith('http'));
    });
  });
}
