import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mekuru/features/viewer/presentation/coordinators/viewer_scroll_tracker.dart';

void main() {
  testWidgets('ViewerScrollTracker respects top and bottom bounds', (WidgetTester tester) async {
    final scrollController = ScrollController();
    final activeKeys = <int, GlobalKey>{};
    int visibleIndex = 0;
    int savedAnchor = -1;

    final tracker = ViewerScrollTracker(
      scrollController: scrollController,
      activeKeys: activeKeys,
      getTotalPages: () => 10,
      onVisibleIndexChanged: (idx) => visibleIndex = idx,
      onSaveProgress: (anchor, offset) => savedAnchor = anchor,
      saveDebounceDuration: const Duration(milliseconds: 50),
      initialIndex: 0,
    );

    // Build scrollable widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListView.builder(
            controller: scrollController,
            itemCount: 10,
            itemExtent: 500,
            itemBuilder: (context, index) {
              final key = activeKeys.putIfAbsent(index, () => GlobalKey());
              return Container(key: key, color: index.isEven ? Colors.blue : Colors.red);
            },
          ),
        ),
      ),
    );

    // At top: pixels == 0
    tracker.onScroll();
    expect(visibleIndex, 0);

    // Scroll near the end
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
    tracker.onScroll();
    expect(visibleIndex, 9); // edge lock sets to last page

    tracker.saveNow();
    expect(savedAnchor, 9);

    tracker.dispose();
  });
}
