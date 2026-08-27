import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/data/repositories/archive_repository.dart';
import 'package:mekuru/core/models/archive_task.dart';
import 'dart:async';
import 'package:dio/dio.dart';

class ArchiveState {
  final bool isLoading;
  final List<ArchiveTask> tasks;
  final Map<String, dynamic> metadata;
  final String? error;

  ArchiveState({
    this.isLoading = false,
    this.tasks = const [],
    this.metadata = const {},
    this.error,
  });

  ArchiveState copyWith({
    bool? isLoading,
    List<ArchiveTask>? tasks,
    Map<String, dynamic>? metadata,
    String? error,
    bool clearError = false,
  }) {
    return ArchiveState(
      isLoading: isLoading ?? this.isLoading,
      tasks: tasks ?? this.tasks,
      metadata: metadata ?? this.metadata,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

class ArchiveNotifier extends Notifier<ArchiveState> {
  @override
  ArchiveState build() {
    // Initial load
    Future.microtask(() => loadTasks());
    return ArchiveState();
  }

  Future<void> loadTasks({bool silent = false}) async {
    if (!silent) {
      state = state.copyWith(isLoading: true, clearError: true);
    }
    
    try {
      final repo = ref.read(archiveRepositoryProvider);
      final tasks = await repo.getActiveTasks();
      
      state = state.copyWith(
        isLoading: false,
        tasks: tasks,
        metadata: {},
      );
    } catch (e) {
      if (!silent) {
        state = state.copyWith(isLoading: false, error: e.toString());
      }
    }
  }

  Future<bool> pauseTask(String providerId, String comicId) async {
    final success = await ref.read(archiveRepositoryProvider).pauseTask(providerId, comicId);
    if (success) await loadTasks(silent: true);
    return success;
  }

  Future<bool> resumeTask(String providerId, String comicId) async {
    final success = await ref.read(archiveRepositoryProvider).resumeTask(providerId, comicId);
    if (success) await loadTasks(silent: true);
    return success;
  }

  Future<bool> cancelTask(String providerId, String comicId) async {
    final success = await ref.read(archiveRepositoryProvider).cancelTask(providerId, comicId);
    if (success) await loadTasks(silent: true);
    return success;
  }

  Future<bool> deleteComic(String providerId, String comicId) async {
    final success = await ref.read(archiveRepositoryProvider).deleteComic(providerId, comicId);
    if (success) await loadTasks(silent: true);
    return success;
  }

  Future<String?> startDownload(String providerId, String comicId) async {
    try {
      await ref.read(archiveRepositoryProvider).startSync(providerId, comicId);
      await loadTasks(silent: true);
      return null;
    } catch (e) {
      if (e is DioException && e.response?.data != null) {
        final data = e.response!.data;
        if (data is Map<String, dynamic> && data['detail'] != null) {
          return data['detail'].toString();
        }
      }
      return e.toString();
    }
  }
}

final archiveProvider = NotifierProvider<ArchiveNotifier, ArchiveState>(() {
  return ArchiveNotifier();
});

