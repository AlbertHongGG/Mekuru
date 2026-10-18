import 'package:flutter_test/flutter_test.dart';
import 'package:mekuru/features/comic/domain/models/chapter.dart';
import 'package:mekuru/features/comic/domain/models/chapter_sequence.dart';

void main() {
  group('ChapterSequence', () {
    test('Empty sequence handles queries gracefully', () {
      const sequence = ChapterSequence.empty();
      expect(sequence.length, 0);
      expect(sequence.isEmpty, true);
      expect(sequence.getPrevious('1'), isNull);
      expect(sequence.getNext('1'), isNull);
      expect(sequence.getChronologicalIndex('1'), 1);
      expect(sequence.findById('1'), isNull);
      expect(sequence.toDisplayList(isDescending: true), isEmpty);
      expect(sequence.toDisplayList(isDescending: false), isEmpty);
    });

    test('Canonical sequence with pure Chinese titles navigates correctly', () {
      // Recreating the real comicWF case: "我的模擬長生路"
      final rawChapters = [
        const Chapter(id: 'c84', title: '初試坐山訣', order: 84),
        const Chapter(id: 'c85', title: '渡法明月宮', order: 85),
        const Chapter(id: 'c86', title: '道韻悟神掌', order: 86),
        const Chapter(id: 'c87', title: '陣法無極限', order: 87),
        const Chapter(id: 'c88', title: '星落歸蒼梧', order: 88),
        const Chapter(id: 'c89', title: '瘋狂的擴張', order: 89),
      ];

      final sequence = ChapterSequence(rawChapters);

      // Verify length & indexing
      expect(sequence.length, 6);
      expect(sequence.first.title, '初試坐山訣');
      expect(sequence.last.title, '瘋狂的擴張');

      // Test Chapter 88: "星落歸蒼梧"
      final currentId = 'c88';
      expect(sequence.getChronologicalIndex(currentId), 5); // 5th in this sequence (or 88)

      // Next chapter must be Chapter 89: "瘋狂的擴張"
      final nextChapter = sequence.getNext(currentId);
      expect(nextChapter, isNotNull);
      expect(nextChapter!.id, 'c89');
      expect(nextChapter.title, '瘋狂的擴張');

      // Previous chapter must be Chapter 87: "陣法無極限"
      final prevChapter = sequence.getPrevious(currentId);
      expect(prevChapter, isNotNull);
      expect(prevChapter!.id, 'c87');
      expect(prevChapter.title, '陣法無極限');

      // Boundary tests
      // First chapter (c84) has no previous
      expect(sequence.getPrevious('c84'), isNull);
      expect(sequence.getNext('c84')!.id, 'c85');

      // Last chapter (c89) has no next
      expect(sequence.getNext('c89'), isNull);
      expect(sequence.getPrevious('c89')!.id, 'c88');
    });

    test('toDisplayList provides views without mutating canonical sequence', () {
      final chapters = [
        const Chapter(id: '1', title: '第一回'),
        const Chapter(id: '2', title: '第二回'),
        const Chapter(id: '3', title: '第三回'),
      ];
      final sequence = ChapterSequence(chapters);

      final descendingView = sequence.toDisplayList(isDescending: true);
      expect(descendingView.map((c) => c.id).toList(), ['3', '2', '1']);

      final ascendingView = sequence.toDisplayList(isDescending: false);
      expect(ascendingView.map((c) => c.id).toList(), ['1', '2', '3']);

      // Ensure the sequence itself is untouched
      expect(sequence.chapters.map((c) => c.id).toList(), ['1', '2', '3']);
    });
  });
}
