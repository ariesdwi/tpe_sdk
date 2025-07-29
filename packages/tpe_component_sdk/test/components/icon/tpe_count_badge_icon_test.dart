import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tpe_component_sdk/components/icon/tpe_count_badge_icon.dart';

void main() {
  group('TPECountBadgeIcon Tests', () {
    testWidgets('should render badge with count', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: TPECountBadgeIcon(badgeCount: 5))),
      );

      expect(find.text('5'), findsOneWidget);
    });

    testWidgets('should not render when badge count is 0', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: TPECountBadgeIcon(badgeCount: 0))),
      );

      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(Container), findsNothing);
    });

    testWidgets('should not render when badge count is negative', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: TPECountBadgeIcon(badgeCount: -1))),
      );

      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(Container), findsNothing);
    });

    testWidgets('should apply correct badge size', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: TPECountBadgeIcon(badgeCount: 5, badgeSize: 24)),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.constraints?.maxWidth, equals(24));
      expect(container.constraints?.maxHeight, equals(24));
    });

    testWidgets('should apply correct badge color', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPECountBadgeIcon(badgeCount: 5, badgeColor: Colors.blue),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, equals(Colors.blue));
    });

    testWidgets('should apply correct text color', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPECountBadgeIcon(
              badgeCount: 5,
              badgeTextColor: Colors.black,
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.byType(Text));
      expect(text.style?.color, equals(Colors.black));
    });

    testWidgets('should apply correct border', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: TPECountBadgeIcon(badgeCount: 5))),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.border?.top.width, equals(1.5));
    });

    testWidgets('should apply correct shape', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: TPECountBadgeIcon(badgeCount: 5))),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.shape, equals(BoxShape.circle));
    });

    testWidgets('should center text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: TPECountBadgeIcon(badgeCount: 5))),
      );

      final center = tester.widget<Center>(find.byType(Center));
      expect(center.child, isA<Text>());
    });

    testWidgets('should apply correct font size based on badge size', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: TPECountBadgeIcon(badgeCount: 5, badgeSize: 20)),
        ),
      );

      final text = tester.widget<Text>(find.byType(Text));
      expect(text.style?.fontSize, equals(12)); // 20 * 0.6 = 12
    });

    testWidgets('should apply correct font weight', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: TPECountBadgeIcon(badgeCount: 5))),
      );

      final text = tester.widget<Text>(find.byType(Text));
      expect(text.style?.fontWeight, equals(FontWeight.bold));
    });

    testWidgets('should use default values when not specified', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: TPECountBadgeIcon(badgeCount: 5))),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final text = tester.widget<Text>(find.byType(Text));
      final decoration = container.decoration as BoxDecoration;

      expect(container.constraints?.maxWidth, equals(16)); // Default badgeSize
      expect(container.constraints?.maxHeight, equals(16)); // Default badgeSize
      expect(decoration.color, equals(Colors.red)); // Default badgeColor
      expect(text.style?.color, equals(Colors.white)); // Default badgeTextColor
    });

    testWidgets('should handle large badge count', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: TPECountBadgeIcon(badgeCount: 999))),
      );

      expect(find.text('999'), findsOneWidget);
    });

    testWidgets('should handle single digit count', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: TPECountBadgeIcon(badgeCount: 1))),
      );

      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('should handle double digit count', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: TPECountBadgeIcon(badgeCount: 42))),
      );

      expect(find.text('42'), findsOneWidget);
    });

    testWidgets('should handle triple digit count', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: TPECountBadgeIcon(badgeCount: 123))),
      );

      expect(find.text('123'), findsOneWidget);
    });

    testWidgets('should handle very large badge size', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPECountBadgeIcon(badgeCount: 5, badgeSize: 100),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final text = tester.widget<Text>(find.byType(Text));

      expect(container.constraints?.maxWidth, equals(100));
      expect(container.constraints?.maxHeight, equals(100));
      expect(text.style?.fontSize, equals(60)); // 100 * 0.6 = 60
    });

    testWidgets('should handle very small badge size', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: TPECountBadgeIcon(badgeCount: 5, badgeSize: 8)),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final text = tester.widget<Text>(find.byType(Text));

      expect(container.constraints?.maxWidth, equals(8));
      expect(container.constraints?.maxHeight, equals(8));
      expect(text.style?.fontSize, equals(4.8)); // 8 * 0.6 = 4.8
    });
  });
}
