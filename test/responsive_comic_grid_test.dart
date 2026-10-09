import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mekuru/core/widgets/responsive_comic_grid.dart';
import 'package:mekuru/features/comic/domain/models/comic_card_data.dart';

void main() {
  group('ResponsiveComicGrid Unit & Widget Tests', () {
    final card1 = ComicCardData(
      providerId: 'manwa',
      comicId: 'c1',
      title: 'Comic 1',
    );
    final card2 = ComicCardData(
      providerId: 'manwa',
      comicId: 'c2',
      title: 'Comic 2',
    );
    final card3 = ComicCardData(
      providerId: 'webtoon',
      comicId: 'c3',
      title: 'Comic 3',
    );

    testWidgets('renders all items and handles removal with proper dynamic keys', (tester) async {
      ComicCardData? tappedCard;
      ComicCardData? longPressedCard;

      var currentList = [card1, card2, card3];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return ResponsiveComicGrid(
                  comics: currentList,
                  onTap: (c) => tappedCard = c,
                  onLongPress: (c) => longPressedCard = c,
                );
              },
            ),
          ),
        ),
      );

      // Verify all 3 cards exist
      expect(find.byKey(const ValueKey('manwa_c1')), findsOneWidget);
      expect(find.byKey(const ValueKey('manwa_c2')), findsOneWidget);
      expect(find.byKey(const ValueKey('webtoon_c3')), findsOneWidget);

      // Tap card 1
      await tester.tap(find.byKey(const ValueKey('manwa_c1')));
      expect(tappedCard, equals(card1));

      // Long press card 2
      await tester.longPress(find.byKey(const ValueKey('manwa_c2')));
      expect(longPressedCard, equals(card2));

      // Now simulate removing card 2 (Dislike action)
      currentList = [card1, card3];
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ResponsiveComicGrid(
              comics: currentList,
              onTap: (c) => tappedCard = c,
              onLongPress: (c) => longPressedCard = c,
            ),
          ),
        ),
      );

      // Verify card 2 is removed, while card 1 and card 3 smoothly remain
      expect(find.byKey(const ValueKey('manwa_c1')), findsOneWidget);
      expect(find.byKey(const ValueKey('manwa_c2')), findsNothing);
      expect(find.byKey(const ValueKey('webtoon_c3')), findsOneWidget);
    });
  });
}
