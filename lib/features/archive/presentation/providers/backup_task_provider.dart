import 'package:flutter_riverpod/flutter_riverpod.dart';

class BackupTaskState {
  final bool isWorking;
  final double progress;
  final String message;
  final String? error;

  BackupTaskState({
    this.isWorking = false,
    this.progress = 0.0,
    this.message = '',
    this.error,
  });

  BackupTaskState copyWith({
    bool? isWorking,
    double? progress,
    String? message,
    String? error,
  }) {
    return BackupTaskState(
      isWorking: isWorking ?? this.isWorking,
      progress: progress ?? this.progress,
      message: message ?? this.message,
      error: error,
    );
  }
}

class BackupTaskNotifier extends Notifier<BackupTaskState> {
  @override
  BackupTaskState build() {
    return BackupTaskState();
  }

  void start(String message) {
    state = BackupTaskState(isWorking: true, progress: 0.0, message: message, error: null);
  }

  void updateProgress(double progress, String message) {
    state = state.copyWith(progress: progress, message: message);
  }

  void finish(String message) {
    state = state.copyWith(isWorking: false, progress: 1.0, message: message);
  }

  void fail(String error) {
    state = state.copyWith(isWorking: false, error: error);
  }
}

final backupTaskProvider = NotifierProvider<BackupTaskNotifier, BackupTaskState>(() {
  return BackupTaskNotifier();
});
