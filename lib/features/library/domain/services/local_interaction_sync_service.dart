import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/features/archive/domain/managers/i_local_library_manager.dart';
import 'package:mekuru/features/archive/domain/managers/local_library_manager.dart';
import 'package:mekuru/features/library/data/repositories/user_interaction_repository.dart';
import 'package:mekuru/features/archive/data/providers/local_provider.dart';
import 'dart:async';

final localInteractionSyncServiceProvider = Provider<LocalInteractionSyncService>((ref) {
  final libraryManager = ref.watch(localLibraryManagerProvider);
  final interactionRepo = ref.watch(userInteractionRepositoryProvider);
  final service = LocalInteractionSyncService(libraryManager, interactionRepo);
  ref.onDispose(() => service.dispose());
  return service;
});

class LocalInteractionSyncService {
  final ILocalLibraryManager _libraryManager;
  final UserInteractionRepository _interactionRepo;
  StreamSubscription? _subscription;

  LocalInteractionSyncService(this._libraryManager, this._interactionRepo) {
    _init();
  }

  void _init() {
    _subscription = _libraryManager.watchLibraryChanges().listen((event) {
      if (event is ComicDeletedEvent) {
        _interactionRepo.deleteInteraction(
          providerId: LocalProvider.providerIdentifier, 
          comicId: event.comicId
        );
      }
    });
  }

  void dispose() {
    _subscription?.cancel();
  }
}
