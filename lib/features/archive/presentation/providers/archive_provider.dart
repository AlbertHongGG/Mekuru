import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/data/repositories/archive_repository.dart';
import 'package:mekuru/domain/models/archive_task.dart';
import 'dart:async';

class ArchiveState {
  final bool isLoading;
  final List<ArchiveTask> tasks;
  final String? error;

  ArchiveState({
    this.isLoading = false,
    this.tasks = const [],
    this.error,
  });

  ArchiveState copyWith({
    bool? isLoading,
    List<ArchiveTask>? tasks,
    String? error,
  }) {
    return ArchiveState(
      isLoading: isLoading ?? this.isLoading,
      tasks: tasks ?? this.tasks,
      error: error,
    );
  }
}

class ArchiveNotifier extends Notifier<ArchiveState> {
  Timer? _timer;

  @override
  ArchiveState build() {
    Future.microtask(() {
      loadTasks();
      _timer = Timer.periodic(const Duration(seconds: 5), (_) {
        loadTasks(silent: true);
      });
    });
    
    ref.onDispose(() {
      _timer?.cancel();
    });
    
    return ArchiveState();
  }

  Future<void> loadTasks({bool silent = false}) async {
    if (!silent) {
      state = state.copyWith(isLoading: true, error: null);
    }
    
    try {
      final repo = ref.read(archiveRepositoryProvider);
      final tasks = await repo.getActiveTasks();
      
      state = state.copyWith(
        isLoading: false,
        tasks: tasks,
      );
    } catch (e) {
      if (!silent) {
        state = state.copyWith(isLoading: false, error: e.toString());
      }
    }
  }
}

final archiveProvider = NotifierProvider<ArchiveNotifier, ArchiveState>(() {
  return ArchiveNotifier();
});
