import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/data/sources/provider_registry.dart';
import 'package:mekuru/core/data/repositories/user_interaction_repository.dart';
import 'package:mekuru/core/models/comic_record.dart';

class LibraryUpdateState {
  final bool isUpdating;
  final int totalTasks;
  final int completedTasks;

  LibraryUpdateState({
    this.isUpdating = false,
    this.totalTasks = 0,
    this.completedTasks = 0,
  });

  LibraryUpdateState copyWith({
    bool? isUpdating,
    int? totalTasks,
    int? completedTasks,
  }) {
    return LibraryUpdateState(
      isUpdating: isUpdating ?? this.isUpdating,
      totalTasks: totalTasks ?? this.totalTasks,
      completedTasks: completedTasks ?? this.completedTasks,
    );
  }
}

class LibraryUpdateNotifier extends Notifier<LibraryUpdateState> {
  @override
  LibraryUpdateState build() {
    return LibraryUpdateState();
  }

  Future<void> updateAll(List<ComicRecord> favorites) async {
    if (state.isUpdating || favorites.isEmpty) return;
    
    state = state.copyWith(
      isUpdating: true,
      totalTasks: favorites.length,
      completedTasks: 0,
    );

    final providerRegistry = ref.read(providerRegistryProvider);
    final interactionRepo = ref.read(userInteractionRepositoryProvider);

    final int maxConcurrent = 3;
    int currentTaskIndex = 0;
    
    Future<void> worker() async {
      while (currentTaskIndex < favorites.length) {
        final taskIndex = currentTaskIndex++;
        final record = favorites[taskIndex];
        
        try {
          final provider = providerRegistry.getProvider(record.providerId);
          if (provider != null) {
            final meta = await interactionRepo.getMetadata(record.providerId, record.comicId);
            if (meta != null) {
              final result = await provider.checkForUpdates(record.comicId, meta);
              if (result.isSuccess) {
                final newData = result.getOrThrow();
                if (newData.hasNew) {
                  await interactionRepo.updateMetadataFields(
                                        record.providerId,
                    record.comicId,
                    totalChapters: newData.newTotal,
                    sourceUpdatedAt: newData.newSourceUpdatedAt,
                    latestChapterTitle: newData.newLatestTitle,
                  );
                }
              }
            }
          }
        } catch (_) {
          // Ignore failures
        }
        
        state = state.copyWith(completedTasks: state.completedTasks + 1);
      }
    }

    final workers = <Future>[];
    for (int i = 0; i < maxConcurrent && i < favorites.length; i++) {
      workers.add(worker());
    }

    await Future.wait(workers);
    
    state = state.copyWith(isUpdating: false, completedTasks: 0, totalTasks: 0);
  }
}

final libraryUpdateProvider = NotifierProvider<LibraryUpdateNotifier, LibraryUpdateState>(() {
  return LibraryUpdateNotifier();
});
