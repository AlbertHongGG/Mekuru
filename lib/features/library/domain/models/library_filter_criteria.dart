import 'package:mekuru/features/library/domain/models/comic_record.dart';
import 'package:mekuru/features/library/domain/models/library_sort_mode.dart';

/// Encapsulates all query, filter, and sort conditions for the library.
/// Provides pure domain filtering and sorting logic.
class LibraryFilterCriteria {
  final String? providerId;
  final String searchQuery;
  final LibrarySortMode sortMode;

  const LibraryFilterCriteria({
    this.providerId,
    this.searchQuery = '',
    this.sortMode = LibrarySortMode.added,
  });

  /// Evaluates whether a given [ComicRecord] matches the current criteria.
  bool matches(ComicRecord record) {
    if (providerId != null && record.providerId != providerId) {
      return false;
    }
    if (searchQuery.isNotEmpty) {
      final query = searchQuery.toLowerCase();
      if (!record.title.toLowerCase().contains(query)) {
        return false;
      }
    }
    return true;
  }

  /// Applies filtering and sorting to [source] and returns the resulting list.
  List<ComicRecord> apply(List<ComicRecord> source) {
    final filtered = source.where(matches).toList();
    filtered.sort((a, b) => sortMode.strategy.compare(a, b));
    return filtered;
  }

  LibraryFilterCriteria copyWith({
    String? providerId,
    bool clearProviderFilter = false,
    String? searchQuery,
    LibrarySortMode? sortMode,
  }) {
    return LibraryFilterCriteria(
      providerId: clearProviderFilter ? null : (providerId ?? this.providerId),
      searchQuery: searchQuery ?? this.searchQuery,
      sortMode: sortMode ?? this.sortMode,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LibraryFilterCriteria &&
        other.providerId == providerId &&
        other.searchQuery == searchQuery &&
        other.sortMode == sortMode;
  }

  @override
  int get hashCode => Object.hash(providerId, searchQuery, sortMode);
}
