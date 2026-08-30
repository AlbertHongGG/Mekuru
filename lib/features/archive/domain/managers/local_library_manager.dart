import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/features/archive/data/sources/archive_storage.dart';
import 'package:mekuru/core/data/local/local_storage_providers.dart';
import 'package:mekuru/core/data/local/models/local_comic_entity.dart';
import 'package:mekuru/features/archive/domain/managers/i_local_library_manager.dart';
import 'package:mekuru/features/archive/domain/managers/archive_task_manager.dart';

class LocalLibraryManager implements ILocalLibraryManager {
  final ILocalLibraryStorage _libraryStorage;
  final IMediaStorage _mediaStorage;
  final Ref _ref;
  
  final _changeController = StreamController<void>.broadcast();

  LocalLibraryManager(this._libraryStorage, this._mediaStorage, this._ref);
  
  @override
  Stream<void> watchLibraryChanges() => _changeController.stream;

  @override
  Future<void> saveComic(LocalComicEntity comic) async {
    await _libraryStorage.saveComic(comic);
    _changeController.add(null);
  }

  @override
  Future<List<LocalComicEntity>> getAllComics() async {
    return await _libraryStorage.getAllComics();
  }

  @override
  Future<LocalComicEntity?> getComic(String comicId) async {
    return await _libraryStorage.getComic(comicId);
  }

  @override
  Future<void> deleteComic(String providerId, String comicId) async {
    // 1. Cancel any ongoing task strictly to prevent orphaned background writes.
    await _ref.read(archiveTaskManagerProvider.notifier).cancelTask(providerId, comicId);
    
    // 2. Wipe physical media files on disk.
    await _mediaStorage.deleteMedia(providerId, comicId);
    
    // 3. Remove metadata from local database.
    await _libraryStorage.deleteComic(comicId);
    
    // 4. Notify listeners that the library has changed.
    _changeController.add(null);
  }
}

final localLibraryManagerProvider = Provider<ILocalLibraryManager>((ref) {
  final libStorage = ref.watch(localLibraryStorageProvider);
  final mediaStorage = ref.watch(mediaStorageProvider);
  return LocalLibraryManager(libStorage, mediaStorage, ref);
});
