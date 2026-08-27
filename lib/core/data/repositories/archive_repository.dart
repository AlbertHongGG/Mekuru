import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/network/api_client.dart';
import 'package:mekuru/core/models/archive_task.dart';
import 'dart:developer' as developer;

class ArchiveRepository {
  final Dio _dio;

  ArchiveRepository(this._dio);

  Future<List<ArchiveTask>> getActiveTasks() async {
    try {
      final response = await _dio.get('/api/v1/archive/queue');
      final data = response.data as List;
      return data.map((json) => ArchiveTask.fromJson(json)).toList();
    } on DioException catch (e) {
      developer.log('Failed to fetch active tasks', error: e);
      return [];
    }
  }

  Future<Map<String, dynamic>> getArchivedComics() async {
    try {
      final response = await _dio.get('/api/v1/archive/');
      final data = response.data as List;
      final map = <String, dynamic>{};
      for (var item in data) {
        if (item is Map<String, dynamic>) {
          final comicId = item['comic_id'] as String;
          map[comicId] = item;
        }
      }
      return map;
    } on DioException catch (e) {
      developer.log('Failed to fetch archived comics', error: e);
      return {};
    }
  }

  Future<ArchiveTask?> getTaskProgress(String providerId, String comicId) async {
    try {
      final response = await _dio.get('/api/v1/archive/$providerId/$comicId/progress');
      return ArchiveTask.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return null;
      developer.log('Failed to fetch task progress', error: e);
      rethrow;
    }
  }

  Future<ArchiveTask?> startSync(String providerId, String comicId) async {
    try {
      final response = await _dio.post('/api/v1/archive/$providerId/$comicId/sync');
      return ArchiveTask.fromJson(response.data);
    } on DioException catch (e) {
      developer.log('Failed to start sync', error: e);
      rethrow;
    }
  }

  Future<bool> pauseTask(String providerId, String comicId) async {
    try {
      await _dio.post('/api/v1/archive/$providerId/$comicId/pause');
      return true;
    } on DioException catch (e) {
      developer.log('Failed to pause task', error: e);
      return false;
    }
  }

  Future<bool> resumeTask(String providerId, String comicId) async {
    try {
      await _dio.post('/api/v1/archive/$providerId/$comicId/resume');
      return true;
    } on DioException catch (e) {
      developer.log('Failed to resume task', error: e);
      return false;
    }
  }

  Future<bool> cancelTask(String providerId, String comicId) async {
    try {
      await _dio.delete('/api/v1/archive/$providerId/$comicId/cancel');
      return true;
    } on DioException catch (e) {
      developer.log('Failed to cancel task', error: e);
      return false;
    }
  }

  Future<bool> deleteComic(String providerId, String comicId) async {
    try {
      await _dio.delete('/api/v1/archive/$providerId/$comicId');
      return true;
    } on DioException catch (e) {
      developer.log('Failed to delete comic', error: e);
      return false;
    }
  }
}

final archiveRepositoryProvider = Provider<ArchiveRepository>((ref) {
  return ArchiveRepository(ref.watch(dioProvider));
});
