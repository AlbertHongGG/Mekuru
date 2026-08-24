import 'package:mekuru/core/models/comic_record.dart';

abstract class LibrarySortStrategy {
  int compare(ComicRecord a, ComicRecord b);
}

class AddedSortStrategy implements LibrarySortStrategy {
  @override
  int compare(ComicRecord a, ComicRecord b) {
    final timeA = a.favoriteAt ?? a.updatedAt;
    final timeB = b.favoriteAt ?? b.updatedAt;
    return timeB.compareTo(timeA);
  }
}

class UpdatedSortStrategy implements LibrarySortStrategy {
  @override
  int compare(ComicRecord a, ComicRecord b) {
    final timeA = a.updatedAt;
    final timeB = b.updatedAt;
    return timeB.compareTo(timeA);
  }
}

class ReadSortStrategy implements LibrarySortStrategy {
  @override
  int compare(ComicRecord a, ComicRecord b) {
    // Unread comics sink to the bottom (Epoch 0)
    final timeA = a.readAt ?? DateTime.fromMillisecondsSinceEpoch(0);
    final timeB = b.readAt ?? DateTime.fromMillisecondsSinceEpoch(0);
    
    // If both are unread, sort by added time
    if (timeA.millisecondsSinceEpoch == 0 && timeB.millisecondsSinceEpoch == 0) {
      final addedA = a.favoriteAt ?? a.updatedAt;
      final addedB = b.favoriteAt ?? b.updatedAt;
      return addedB.compareTo(addedA);
    }
    
    return timeB.compareTo(timeA);
  }
}

class TitleSortStrategy implements LibrarySortStrategy {
  @override
  int compare(ComicRecord a, ComicRecord b) {
    // Alphabetical sort (A-Z)
    return a.title.compareTo(b.title);
  }
}

