import 'package:mekuru/core/data/local/models/local_comic_entity.dart';

abstract class ILocalLibraryManager {
  Future<void> saveComic(LocalComicEntity comic);
  Future<List<LocalComicEntity>> getAllComics();
  Future<LocalComicEntity?> getComic(String comicId);
  /// Completely removes the comic from local DB and wipes physical files.
  Future<void> deleteComic(String providerId, String comicId);
}
