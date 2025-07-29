import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tpe_component_sdk/components/button/tpe_component_circle_button.dart';

void main() {
  group('TPECircleIconButton Tests', () {
    testWidgets('should render circle button with icon', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPECircleIconButton(icon: Icons.add, onPressed: () {}),
          ),
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('should handle tap when onPressed is provided', (
      WidgetTester tester,
    ) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPECircleIconButton(
              icon: Icons.add,
              onPressed: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TPECircleIconButton));
      expect(tapped, isTrue);
    });

    testWidgets('should not handle tap when onPressed is null', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPECircleIconButton(icon: Icons.add, onPressed: null),
          ),
        ),
      );

      await tester.tap(find.byType(TPECircleIconButton));
      // Should not throw any error
    });

    testWidgets('should apply correct size', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPECircleIconButton(
              icon: Icons.add,
              size: 80,
              onPressed: () {},
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.constraints?.maxWidth, equals(80));
      expect(container.constraints?.maxHeight, equals(80));
    });

    testWidgets('should apply correct background color', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPECircleIconButton(
              icon: Icons.add,
              backgroundColor: Colors.red,
              onPressed: () {},
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, equals(Colors.red));
    });

    testWidgets('should apply correct icon color', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPECircleIconButton(
              icon: Icons.add,
              iconColor: Colors.yellow,
              onPressed: () {},
            ),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byType(Icon));
      expect(icon.color, equals(Colors.yellow));
    });

    testWidgets('should apply border when borderColor is provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPECircleIconButton(
              icon: Icons.add,
              borderColor: Colors.blue,
              borderWidth: 2,
              onPressed: () {},
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.border?.top.color, equals(Colors.blue));
      expect(decoration.border?.top.width, equals(2));
    });

    testWidgets('should not apply border when borderColor is null', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPECircleIconButton(icon: Icons.add, onPressed: () {}),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.border, isNull);
    });

    testWidgets('should show badge when badgeCount is provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPECircleIconButton(
              icon: Icons.add,
              badgeCount: 5,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('5'), findsOneWidget);
    });

    testWidgets('should not show badge when badgeCount is null', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPECircleIconButton(icon: Icons.add, onPressed: () {}),
          ),
        ),
      );

      expect(find.byType(Text), findsNothing);
    });

    testWidgets('should not show badge when badgeCount is 0', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPECircleIconButton(
              icon: Icons.add,
              badgeCount: 0,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byType(Text), findsNothing);
    });

    testWidgets('should apply correct badge color', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPECircleIconButton(
              icon: Icons.add,
              badgeCount: 5,
              badgeColor: Colors.green,
              onPressed: () {},
            ),
          ),
        ),
      );

      final badgeContainer = tester.widget<Container>(
        find.byType(Container).last,
      );
      final decoration = badgeContainer.decoration as BoxDecoration;
      expect(decoration.color, equals(Colors.green));
    });

    testWidgets('should apply correct badge text color', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPECircleIconButton(
              icon: Icons.add,
              badgeCount: 5,
              badgeTextColor: Colors.black,
              onPressed: () {},
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.byType(Text));
      expect(text.style?.color, equals(Colors.black));
    });

    testWidgets('should apply shadow when showShadow is true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPECircleIconButton(
              icon: Icons.add,
              showShadow: true,
              onPressed: () {},
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.boxShadow, isNotNull);
      expect(decoration.boxShadow!.length, equals(1));
    });

    testWidgets('should not apply shadow when showShadow is false', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPECircleIconButton(
              icon: Icons.add,
              showShadow: false,
              onPressed: () {},
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.boxShadow, isNull);
    });

    testWidgets('should use default values when not specified', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPECircleIconButton(icon: Icons.add, onPressed: () {}),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final icon = tester.widget<Icon>(find.byType(Icon));
      final decoration = container.decoration as BoxDecoration;

      expect(container.constraints?.maxWidth, equals(50));
      expect(container.constraints?.maxHeight, equals(50));
      expect(icon.color, equals(Colors.white));
      expect(decoration.color, isNotNull);
      expect(decoration.border, isNull);
      expect(decoration.boxShadow, isNull);
    });

    testWidgets('should have circular shape', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPECircleIconButton(icon: Icons.add, onPressed: () {}),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.shape, equals(BoxShape.circle));
    });
  });
}
