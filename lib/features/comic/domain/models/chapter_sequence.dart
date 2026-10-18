import 'package:mekuru/features/comic/domain/models/chapter.dart';

/// Immutable domain aggregate representing the canonical chronological sequence of chapters in a comic.
///
/// Invariant: [chapters] is ALWAYS ordered chronologically (Oldest -> Newest: Chapter 1 -> Chapter N).
class ChapterSequence {
  final List<Chapter> chapters;

  const ChapterSequence(this.chapters);

  const ChapterSequence.empty() : chapters = const [];

  int get length => chapters.length;
  bool get isEmpty => chapters.isEmpty;
  bool get isNotEmpty => chapters.isNotEmpty;

  Chapter get first => chapters.first;
  Chapter get last => chapters.last;

  Chapter operator [](int index) => chapters[index];

  /// Returns the chronologically previous chapter in the storyline,
  /// or null if [currentChapterId] is the first chapter or not found.
  Chapter? getPrevious(String currentChapterId) {
    final idx = chapters.indexWhere((c) => c.id == currentChapterId);
    if (idx <= 0) return null;
    return chapters[idx - 1];
  }

  /// Returns the chronologically next chapter in the storyline,
  /// or null if [currentChapterId] is the latest chapter or not found.
  Chapter? getNext(String currentChapterId) {
    final idx = chapters.indexWhere((c) => c.id == currentChapterId);
    if (idx == -1 || idx >= chapters.length - 1) return null;
    return chapters[idx + 1];
  }

  /// Returns the 1-based chronological index of the chapter in the storyline (1 to N).
  /// If not found, returns 1 as safe fallback.
  int getChronologicalIndex(String currentChapterId) {
    final idx = chapters.indexWhere((c) => c.id == currentChapterId);
    return idx == -1 ? 1 : idx + 1;
  }

  /// Finds a chapter by its ID.
  Chapter? findById(String chapterId) {
    final idx = chapters.indexWhere((c) => c.id == chapterId);
    return idx == -1 ? null : chapters[idx];
  }

  /// Returns a display projection of chapters based on presentation sort preference.
  /// Does NOT mutate the underlying canonical sequence.
  List<Chapter> toDisplayList({required bool isDescending}) {
    if (isDescending) {
      return chapters.reversed.toList();
    }
    return List.unmodifiable(chapters);
  }
}
