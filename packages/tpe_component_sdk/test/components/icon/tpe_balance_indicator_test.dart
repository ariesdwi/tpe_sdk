import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tpe_component_sdk/components/icon/tpe_balance_indicator.dart';

void main() {
  group('TPEBalanceIndicator Tests', () {
    testWidgets('should render balance indicator with default values', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: TPEBalanceIndicator())),
      );

      expect(find.byType(TPEBalanceIndicator), findsOneWidget);
      expect(
        find.byType(Container),
        findsNWidgets(5),
      ); // Default itemCount is 5
    });

    testWidgets('should render correct number of items', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: TPEBalanceIndicator(itemCount: 3))),
      );

      expect(find.byType(Container), findsNWidgets(3));
    });

    testWidgets('should apply correct size to each item', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: TPEBalanceIndicator(size: 16))),
      );

      final containers = tester.widgetList<Container>(find.byType(Container));
      for (final container in containers) {
        expect(container.constraints?.maxWidth, equals(16));
        expect(container.constraints?.maxHeight, equals(16));
      }
    });

    testWidgets('should apply correct color to each item', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: TPEBalanceIndicator(color: Colors.red)),
        ),
      );

      final containers = tester.widgetList<Container>(find.byType(Container));
      for (final container in containers) {
        final decoration = container.decoration as BoxDecoration;
        expect(decoration.color, equals(Colors.red));
      }
    });

    testWidgets('should apply correct spacing between items', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: TPEBalanceIndicator(spacing: 12))),
      );

      final containers = tester.widgetList<Container>(find.byType(Container));
      for (int i = 0; i < containers.length - 1; i++) {
        final container = containers.elementAt(i);
        expect(container.margin, equals(EdgeInsets.only(right: 12)));
      }

      // Last item should have no right margin
      final lastContainer = containers.last;
      expect(lastContainer.margin, equals(EdgeInsets.only(right: 0)));
    });

    testWidgets('should apply correct border radius', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: TPEBalanceIndicator(size: 20))),
      );

      final containers = tester.widgetList<Container>(find.byType(Container));
      for (final container in containers) {
        final decoration = container.decoration as BoxDecoration;
        expect(
          decoration.borderRadius,
          equals(BorderRadius.circular(10)),
        ); // size/2 = 20/2 = 10
      }
    });

    testWidgets('should render in a row layout', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: TPEBalanceIndicator())),
      );

      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('should use default values when not specified', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: TPEBalanceIndicator())),
      );

      final containers = tester.widgetList<Container>(find.byType(Container));
      final firstContainer = containers.first;
      final decoration = firstContainer.decoration as BoxDecoration;

      expect(containers.length, equals(5)); // Default itemCount
      expect(firstContainer.constraints?.maxWidth, equals(12)); // Default size
      expect(firstContainer.constraints?.maxHeight, equals(12)); // Default size
      expect(decoration.color, isNotNull); // Default color
    });

    testWidgets('should handle zero item count', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: TPEBalanceIndicator(itemCount: 0))),
      );

      expect(find.byType(Container), findsNothing);
    });

    testWidgets('should handle single item', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: TPEBalanceIndicator(itemCount: 1))),
      );

      expect(find.byType(Container), findsOneWidget);

      final container = tester.widget<Container>(find.byType(Container));
      expect(
        container.margin,
        equals(EdgeInsets.only(right: 0)),
      ); // No right margin for single item
    });

    testWidgets('should handle large item count', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: TPEBalanceIndicator(itemCount: 10))),
      );

      expect(find.byType(Container), findsNWidgets(10));
    });

    testWidgets('should handle custom spacing with single item', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: TPEBalanceIndicator(itemCount: 1, spacing: 20)),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(
        container.margin,
        equals(EdgeInsets.only(right: 0)),
      ); // No spacing for single item
    });

    testWidgets('should handle custom spacing with multiple items', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: TPEBalanceIndicator(itemCount: 3, spacing: 15)),
        ),
      );

      final containers = tester.widgetList<Container>(find.byType(Container));

      // First two items should have right margin
      expect(
        containers.elementAt(0).margin,
        equals(EdgeInsets.only(right: 15)),
      );
      expect(
        containers.elementAt(1).margin,
        equals(EdgeInsets.only(right: 15)),
      );

      // Last item should have no right margin
      expect(containers.elementAt(2).margin, equals(EdgeInsets.only(right: 0)));
    });
  });
}
