import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/error/result.dart';
import 'package:mekuru/core/utils/chinese_conversion_service.dart';
import 'package:mekuru/features/comic/domain/repositories/i_comic_repository.dart';
import 'package:mekuru/core/data/providers/repository_providers.dart';
import 'package:mekuru/features/comic/domain/models/comic_models.dart';
import 'package:mekuru/features/comic/domain/models/paginated_result.dart';

final searchComicsUseCaseProvider = Provider<SearchComicsUseCase>((ref) {
  final repository = ref.watch(comicRepositoryProvider);
  final conversionService = ref.watch(chineseConversionServiceProvider);
  return SearchComicsUseCase(repository, conversionService);
});

class SearchComicsUseCase {
  final IComicRepository _repository;
  final IChineseConversionService _conversionService;

  SearchComicsUseCase(this._repository, this._conversionService);

  Future<Result<PaginatedResult<ComicSearchResult>, Failure>> execute(String providerId, String keyword, int page) async {
    if (!_conversionService.containsChinese(keyword)) {
      return _repository.searchComics(providerId, keyword, page);
    }

    final tradKeyword = await _conversionService.toTraditional(keyword);
    final simpKeyword = await _conversionService.toSimplified(keyword);

    if (tradKeyword == simpKeyword) {
      return _repository.searchComics(providerId, keyword, page);
    }

    // 發起併發請求
    final results = await Future.wait([
      _repository.searchComics(providerId, tradKeyword, page),
      _repository.searchComics(providerId, simpKeyword, page),
    ]);

    final tradResult = results[0];
    final simpResult = results[1];

    if (tradResult.isFailure && simpResult.isFailure) {
      // 兩者皆失敗，回傳其中一個錯誤
      return tradResult;
    }

    // 取得成功的部分，若某一個失敗則當作空陣列處理
    final tradPaginated = tradResult.isSuccess ? tradResult.getOrThrow() : PaginatedResult<ComicSearchResult>(items: [], page: page, hasNext: false);
    final simpPaginated = simpResult.isSuccess ? simpResult.getOrThrow() : PaginatedResult<ComicSearchResult>(items: [], page: page, hasNext: false);

    final tradItems = tradPaginated.items;
    final simpItems = simpPaginated.items;

    final Set<String> seenIds = {};
    final List<ComicSearchResult> mergedItems = [];

    final maxLength = max(tradItems.length, simpItems.length);

    // 雙指標交叉合併
    for (int i = 0; i < maxLength; i++) {
      if (i < tradItems.length) {
        final item = tradItems[i];
        if (!seenIds.contains(item.comicId)) {
          seenIds.add(item.comicId);
          mergedItems.add(item);
        }
      }
      
      if (i < simpItems.length) {
        final item = simpItems[i];
        if (!seenIds.contains(item.comicId)) {
          seenIds.add(item.comicId);
          mergedItems.add(item);
        }
      }
    }

    return Success(PaginatedResult<ComicSearchResult>(
      items: mergedItems,
      page: page,
      hasNext: tradPaginated.hasNext || simpPaginated.hasNext,
    ));
  }
}
