import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/network/api_client.dart';
import 'package:mekuru/domain/models/archive_task.dart';

class ArchiveRepository {
  final Dio _dio;

  ArchiveRepository(this._dio);

  Future<List<ArchiveTask>> getActiveTasks() async {
    final response = await _dio.get('/api/v1/archive/sync/active');
    final data = response.data as List;
    return data.map((json) => ArchiveTask.fromJson(json)).toList();
  }

  Future<ArchiveTask> getTaskProgress(String providerId, String comicId) async {
    final response = await _dio.get('/api/v1/archive/$providerId/$comicId/progress');
    return ArchiveTask.fromJson(response.data);
  }

  Future<void> startSync(String providerId, String comicId) async {
    await _dio.post('/api/v1/archive/$providerId/$comicId/sync');
  }
}

final archiveRepositoryProvider = Provider<ArchiveRepository>((ref) {
  return ArchiveRepository(ref.watch(dioProvider));
});
