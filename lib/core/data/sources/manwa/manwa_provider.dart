import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:mekuru/core/network/api_client.dart';
import 'package:mekuru/core/data/sources/base_comic_provider.dart';
import 'package:mekuru/core/error/failures.dart';
import 'package:mekuru/core/error/result.dart';
import 'package:mekuru/core/models/chapter.dart';
import 'package:mekuru/core/models/comic_models.dart';
import 'package:mekuru/core/models/page.dart';
import 'package:mekuru/core/models/paginated_result.dart';
import 'package:mekuru/core/models/update_check_result.dart';
import 'package:mekuru/core/data/local/models/comic_metadata_entity.dart';
import 'manwa_api_client.dart';
import 'manwa_interceptor.dart';
import 'manwa_crypto.dart';

class ManwaProvider extends BaseComicProvider {
  static const String _id = 'manwa';
  static const String _name = 'Manwa';

  late final ManwaApiClient _apiClient;

  late final Dio _apiDio;
  late final Dio _imageDio;

  ManwaProvider(ApiClient apiClient) {
    _apiDio = apiClient.createProviderDio('http://mseeowpm.pro', providerId: _id);
    _apiDio.interceptors.add(ManwaInterceptor());
    _apiClient = ManwaApiClient(_apiDio);

    _imageDio = apiClient.createProviderDio('', providerId: _id);
    _imageDio.options.headers.addAll({
      'Referer': 'http://mseeowpm1.xyz',
      'User-Agent':
          'Mozilla/5.0 (Linux; Android 10; SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36 mwa-1.1.26+1',
    });
  }

  @override
  Dio get imageDio => _imageDio;

  @override
  String get providerId => _id;

  @override
  String get providerName => _name;

  @override
  Future<Uint8List> fetchImageBytes(String url) async {
    final response = await imageDio.get<List<int>>(
      url,
      options: Options(responseType: ResponseType.bytes),
    );
    final encryptedBytes = Uint8List.fromList(response.data!);
    final decryptedBytes = ManwaCrypto.decryptImageBytes(encryptedBytes);
    
    if (decryptedBytes != null) {
      return decryptedBytes;
    }
    
    // Fallback to original bytes in case it's not encrypted (e.g. standard file)
    return encryptedBytes;
  }

  @override
  Future<Result<ComicDetail, Failure>> getComicDetail(String comicId) async {
    return handleApiCall(() async {
      final response = await _apiClient.getComicDetail(comicId);
      final data = response.data;

      return ComicDetail(
        providerId: providerId,
        comicId: comicId,
        title: data.name,
        coverUrl: data.picx ?? '',
        author: data.author.isNotEmpty ? data.author.join(', ') : '未知作者',
        description: data.text ?? '',
        status: data.state ?? '',
        tags: data.tags.map((t) => t.name).toList(),
      );
    });
  }

  @override
  Future<Result<List<Chapter>, Failure>> getChapterList(String comicId,
      {bool isDescending = true}) async {
    return handleApiCall(() async {
      final response = await _apiClient.getComicDetail(comicId, actionType: 'Chapters');
      final chapters = response.data.chapterList.map((c) {
        return Chapter(
          id: c.id.toString(),
          title: c.name,
          publishedAt: c.addtime,
          order: response.data.chapterList.indexOf(c),
        );
      }).toList();

      if (isDescending) {
        return chapters.reversed.toList();
      }
      return chapters;
    });
  }

  @override
  Future<Result<List<ComicPage>, Failure>> getChapterImages(
      String comicId, String chapterId) async {
    return handleApiCall(() async {
      final response = await _apiClient.getChapterImages(chapterId);
      return response.data.piclist.asMap().entries.map((e) {
        return ComicPage(
          imageUrl: e.value.pic,
          index: e.key,
        );
      }).toList();
    });
  }

  @override
  Future<Result<PaginatedResult<ComicSearchResult>, Failure>> searchComics(
      String keyword, int page) async {
    return handleApiCall(() async {
      final response = await _apiClient.searchComics(keyword, page: page);
      final list = response.data.list.map((item) {
        return ComicSearchResult(
          providerId: providerId,
          comicId: item.id.toString(),
          title: item.name,
          coverUrl: item.picx ?? item.pic ?? '',
          tags: const [],
        );
      }).toList();

      return PaginatedResult(
        items: list,
        page: page,
        hasNext: list.isNotEmpty,
      );
    });
  }

  @override
  Future<Result<PaginatedResult<ComicExploreResult>, Failure>> exploreComics(
      int page) async {
    return handleApiCall(() async {
      final response = await _apiClient.getExploreComics(page: page);
      final list = response.data.list.map((item) {
        return ComicExploreResult(
          providerId: providerId,
          comicId: item.id.toString(),
          title: item.name,
          coverUrl: item.picx ?? item.pic ?? '',
          tags: const [],
        );
      }).toList();

      return PaginatedResult(
        items: list,
        page: page,
        hasNext: list.isNotEmpty,
      );
    });
  }

  @override
  Future<Result<UpdateCheckResult, Failure>> checkForUpdates(
      String comicId, ComicMetadataEntity currentMeta) async {
    return handleApiCall(() async {
      final response = await _apiClient.getComicDetail(comicId);
      final chapterList = response.data.chapterList;
      final currentTotal = currentMeta.totalChapters ?? 0;
      
      if (chapterList.isEmpty) {
        return UpdateCheckResult(
          hasNew: false,
          newTotal: currentTotal,
        );
      }

      final newTotal = chapterList.length;
      final hasNew = newTotal > currentTotal;

      DateTime? latestTime;
      final ch = chapterList.first;
      if (ch.addtime != null && ch.addtime!.isNotEmpty) {
        latestTime = DateTime.tryParse(ch.addtime!);
      }

      return UpdateCheckResult(
        hasNew: hasNew,
        newTotal: newTotal > 0 ? newTotal : currentTotal,
        newSourceUpdatedAt: latestTime,
        newLatestTitle: ch.name,
      );
    });
  }
}
