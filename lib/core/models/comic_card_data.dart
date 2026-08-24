import 'package:mekuru/core/models/comic_base.dart';
import 'package:mekuru/core/models/comic_models.dart';

class ComicCardData {
  final String comicId;
  final String providerId;
  final String? title;
  final String? coverUrl;
  final String? author;
  final List<String> tags;
  final String? progressLabel;

  const ComicCardData({
    required this.comicId,
    required this.providerId,
    this.title,
    this.coverUrl,
    this.author,
    this.tags = const [],
    this.progressLabel,
  });

  factory ComicCardData.fromComic(IComicItem comic, {List<String>? overrideTags, String? progressLabel}) {
    String? author;
    List<String> tags = overrideTags ?? [];
    
    if (overrideTags == null) {
      if (comic is ComicDetail) {
        author = comic.author;
        tags = comic.tags;
      } else if (comic is ComicExploreResult) {
        tags = comic.tags;
      } else if (comic is ComicSearchResult) {
        tags = comic.tags;
      }
    }

    return ComicCardData(
      comicId: comic.comicId,
      providerId: comic.providerId,
      title: comic.title,
      coverUrl: comic.coverUrl,
      author: author,
      tags: tags,
      progressLabel: progressLabel,
    );
  }
}
