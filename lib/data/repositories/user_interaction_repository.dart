import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/network/api_client.dart';
import 'package:mekuru/domain/models/user_interaction.dart';

class UserInteractionRepository {
  final Dio _dio;

  UserInteractionRepository(this._dio);

  Future<List<UserFavorite>> getFavorites() async {
    final response = await _dio.get('/api/v1/user/favorites');
    final data = response.data as List;
    return data.map((json) => UserFavorite.fromJson(json)).toList();
  }

  Future<void> markRead(String providerId, String comicId, {String? chapterId, int? pageIndex}) async {
    await _dio.post('/api/v1/user/interactions/$providerId/$comicId/read', data: {
      if (chapterId != null) 'chapter_id': chapterId,
      if (pageIndex != null) 'page_index': pageIndex,
    });
  }

  Future<UserInteraction> getInteraction(String providerId, String comicId) async {
    final response = await _dio.get('/api/v1/user/interactions/$providerId/$comicId');
    return UserInteraction.fromJson(response.data);
  }

  Future<void> toggleFavorite(String providerId, String comicId, bool isFavorite) async {
    await _dio.post('/api/v1/user/interactions/$providerId/$comicId/favorite', data: {
      'is_favorite': isFavorite,
    });
  }
}

final userInteractionRepositoryProvider = Provider<UserInteractionRepository>((ref) {
  return UserInteractionRepository(ref.watch(dioProvider));
});
