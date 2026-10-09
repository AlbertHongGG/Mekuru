import 'package:flutter_test/flutter_test.dart';
import 'package:mekuru/features/library/domain/models/comic_record.dart';
import 'package:mekuru/features/library/domain/models/library_filter_criteria.dart';
import 'package:mekuru/features/library/domain/models/library_sort_mode.dart';

void main() {
  group('LibraryFilterCriteria Unit Tests', () {
    final record1 = ComicRecord(
      id: 'p1_1',
      providerId: 'manwa',
      comicId: '1',
      title: 'Solo Leveling',
      coverUrl: 'https://example.com/1.jpg',
      updatedAt: DateTime(2025, 1, 1),
      favoriteAt: DateTime(2025, 1, 10),
    );

    final record2 = ComicRecord(
      id: 'p2_2',
      providerId: 'webtoon',
      comicId: '2',
      title: 'Tower of God',
      coverUrl: 'https://example.com/2.jpg',
      updatedAt: DateTime(2025, 1, 2),
      favoriteAt: DateTime(2025, 1, 5),
    );

    final record3 = ComicRecord(
      id: 'p1_3',
      providerId: 'manwa',
      comicId: '3',
      title: 'God of Highschool',
      coverUrl: 'https://example.com/3.jpg',
      updatedAt: DateTime(2025, 1, 3),
      favoriteAt: DateTime(2025, 1, 8),
    );

    final List<ComicRecord> allRecords = [record1, record2, record3];

    test('should match all records when criteria is empty', () {
      const criteria = LibraryFilterCriteria();
      for (final r in allRecords) {
        expect(criteria.matches(r), isTrue);
      }
      expect(criteria.apply(allRecords).length, equals(3));
    });

    test('should filter by providerId correctly', () {
      const criteria = LibraryFilterCriteria(providerId: 'manwa');
      expect(criteria.matches(record1), isTrue);
      expect(criteria.matches(record2), isFalse);
      expect(criteria.matches(record3), isTrue);

      final result = criteria.apply(allRecords);
      expect(result.length, equals(2));
      expect(result.every((r) => r.providerId == 'manwa'), isTrue);
    });

    test('should filter by searchQuery case-insensitively', () {
      const criteria = LibraryFilterCriteria(searchQuery: 'god');
      expect(criteria.matches(record1), isFalse);
      expect(criteria.matches(record2), isTrue);
      expect(criteria.matches(record3), isTrue);

      final result = criteria.apply(allRecords);
      expect(result.length, equals(2));
    });

    test('should combine providerId and searchQuery filters', () {
      const criteria = LibraryFilterCriteria(
        providerId: 'manwa',
        searchQuery: 'god',
      );
      expect(criteria.matches(record1), isFalse);
      expect(criteria.matches(record2), isFalse);
      expect(criteria.matches(record3), isTrue);

      final result = criteria.apply(allRecords);
      expect(result.length, equals(1));
      expect(result.first.comicId, equals('3'));
    });

    test('should sort according to LibrarySortMode', () {
      const criteriaAdded = LibraryFilterCriteria(sortMode: LibrarySortMode.added);
      final sortedByAdded = criteriaAdded.apply(allRecords);
      // favoriteAt: record1 (Jan 10), record3 (Jan 8), record2 (Jan 5)
      expect(sortedByAdded[0].comicId, equals('1'));
      expect(sortedByAdded[1].comicId, equals('3'));
      expect(sortedByAdded[2].comicId, equals('2'));

      const criteriaTitle = LibraryFilterCriteria(sortMode: LibrarySortMode.title);
      final sortedByTitle = criteriaTitle.apply(allRecords);
      // Titles: 'God of Highschool', 'Solo Leveling', 'Tower of God'
      expect(sortedByTitle[0].title, equals('God of Highschool'));
      expect(sortedByTitle[1].title, equals('Solo Leveling'));
      expect(sortedByTitle[2].title, equals('Tower of God'));
    });

    test('copyWith should update or clear properties correctly', () {
      const initial = LibraryFilterCriteria(
        providerId: 'manwa',
        searchQuery: 'test',
        sortMode: LibrarySortMode.title,
      );

      final cleared = initial.copyWith(clearProviderFilter: true);
      expect(cleared.providerId, isNull);
      expect(cleared.searchQuery, equals('test'));
      expect(cleared.sortMode, equals(LibrarySortMode.title));

      final updatedQuery = initial.copyWith(searchQuery: 'new');
      expect(updatedQuery.providerId, equals('manwa'));
      expect(updatedQuery.searchQuery, equals('new'));
    });
  });
}
