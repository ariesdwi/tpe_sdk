import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tpe_component_sdk/components/menu/tpe_component_menu_vertical.dart';
import 'package:tpe_component_sdk/components/icon/tpe_icon_base.dart';

void main() {
  group('TPEHomeMenuItemVertical Tests', () {
    testWidgets('should render menu item with title and icon', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHomeMenuItemVertical(
              title: 'Test Menu',
              iconUrl: 'assets/images/placeholder.png',
            ),
          ),
        ),
      );

      expect(find.text('Test Menu'), findsOneWidget);
      expect(find.byType(TPEBaseIconUrl), findsOneWidget);
    });

    testWidgets('should handle tap when onTap is provided', (
      WidgetTester tester,
    ) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHomeMenuItemVertical(
              title: 'Test Menu',
              iconUrl: 'assets/images/placeholder.png',
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TPEHomeMenuItemVertical));
      expect(tapped, isTrue);
    });

    testWidgets('should not handle tap when onTap is null', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHomeMenuItemVertical(
              title: 'Test Menu',
              iconUrl: 'assets/images/placeholder.png',
              onTap: null,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TPEHomeMenuItemVertical));
      // Should not throw any error
    });

    testWidgets('should show new badge when isNew is true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHomeMenuItemVertical(
              title: 'Test Menu',
              iconUrl: 'assets/images/placeholder.png',
              isNew: true,
            ),
          ),
        ),
      );

      expect(find.text('BARU'), findsOneWidget);
    });

    testWidgets('should not show new badge when isNew is false', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHomeMenuItemVertical(
              title: 'Test Menu',
              iconUrl: 'assets/images/placeholder.png',
              isNew: false,
            ),
          ),
        ),
      );

      expect(find.text('BARU'), findsNothing);
    });

    testWidgets('should apply correct icon size', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHomeMenuItemVertical(
              title: 'Test Menu',
              iconUrl: 'assets/images/placeholder.png',
              iconSize: 64,
            ),
          ),
        ),
      );

      final icon = tester.widget<TPEBaseIconUrl>(find.byType(TPEBaseIconUrl));
      expect(icon.size, equals(64));
    });

    testWidgets('should apply correct text style', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHomeMenuItemVertical(
              title: 'Test Menu',
              iconUrl: 'assets/images/placeholder.png',
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.byType(Text).last);
      expect(text.style?.fontSize, equals(13));
      expect(text.style?.fontWeight, equals(FontWeight.w500));
    });

    testWidgets('should center align text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHomeMenuItemVertical(
              title: 'Test Menu',
              iconUrl: 'assets/images/placeholder.png',
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.byType(Text).last);
      expect(text.textAlign, equals(TextAlign.center));
    });

    testWidgets('should limit text to 2 lines', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHomeMenuItemVertical(
              title: 'Very Long Menu Title That Should Be Truncated',
              iconUrl: 'assets/images/placeholder.png',
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.byType(Text).last);
      expect(text.maxLines, equals(2));
    });

    testWidgets('should apply correct container styling', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHomeMenuItemVertical(
              title: 'Test Menu',
              iconUrl: 'assets/images/placeholder.png',
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.color, equals(const Color(0xFFE6F3FF)));
      expect(decoration.borderRadius, equals(BorderRadius.circular(20)));
    });

    testWidgets('should apply correct padding', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHomeMenuItemVertical(
              title: 'Test Menu',
              iconUrl: 'assets/images/placeholder.png',
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.padding, equals(const EdgeInsets.all(8)));
    });

    testWidgets('should apply correct text width', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHomeMenuItemVertical(
              title: 'Test Menu',
              iconUrl: 'assets/images/placeholder.png',
            ),
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).last);
      expect(sizedBox.width, equals(72));
    });

    testWidgets('should use default values when not specified', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHomeMenuItemVertical(
              title: 'Test Menu',
              iconUrl: 'assets/images/placeholder.png',
            ),
          ),
        ),
      );

      final icon = tester.widget<TPEBaseIconUrl>(find.byType(TPEBaseIconUrl));
      expect(icon.size, equals(48));
      expect(find.text('BARU'), findsNothing);
    });

    testWidgets('should have correct hit test behavior', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHomeMenuItemVertical(
              title: 'Test Menu',
              iconUrl: 'assets/images/placeholder.png',
            ),
          ),
        ),
      );

      final gestureDetector = tester.widget<GestureDetector>(
        find.byType(GestureDetector),
      );
      expect(gestureDetector.behavior, equals(HitTestBehavior.opaque));
    });
  });
}
