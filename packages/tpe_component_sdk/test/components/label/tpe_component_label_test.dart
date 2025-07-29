import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tpe_component_sdk/components/label/tpe_component_label.dart';

void main() {
  group('TPELabelChip Tests', () {
    testWidgets('should render label with correct text', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPELabelChip(
              label: 'Test Label',
              backgroundColor: Colors.blue,
              textColor: Colors.white,
            ),
          ),
        ),
      );

      expect(find.text('Test Label'), findsOneWidget);
    });

    testWidgets('should apply correct background color', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPELabelChip(
              label: 'Test Label',
              backgroundColor: Colors.red,
              textColor: Colors.white,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, equals(Colors.red));
    });

    testWidgets('should apply correct text color', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPELabelChip(
              label: 'Test Label',
              backgroundColor: Colors.blue,
              textColor: Colors.yellow,
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.byType(Text));
      expect(text.style?.color, equals(Colors.yellow));
    });

    testWidgets('should apply correct dimensions', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPELabelChip(
              label: 'Test Label',
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              width: 100,
              height: 40,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.constraints?.maxWidth, equals(100));
      expect(container.constraints?.maxHeight, equals(40));
    });

    testWidgets('should apply correct font size', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPELabelChip(
              label: 'Test Label',
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.byType(Text));
      expect(text.style?.fontSize, equals(18));
    });

    testWidgets('should apply correct font weight', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPELabelChip(
              label: 'Test Label',
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.byType(Text));
      expect(text.style?.fontWeight, equals(FontWeight.bold));
    });

    testWidgets('should apply correct border radius', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPELabelChip(
              label: 'Test Label',
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.borderRadius, equals(BorderRadius.circular(20)));
    });

    testWidgets('should use default values when not specified', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPELabelChip(
              label: 'Test Label',
              backgroundColor: Colors.blue,
              textColor: Colors.white,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final text = tester.widget<Text>(find.byType(Text));
      final decoration = container.decoration as BoxDecoration;

      expect(container.constraints?.maxWidth, equals(68));
      expect(container.constraints?.maxHeight, equals(26));
      expect(text.style?.fontSize, equals(14));
      expect(text.style?.fontWeight, equals(FontWeight.w600));
      expect(
        decoration.borderRadius,
        equals(const BorderRadius.all(Radius.circular(8.0))),
      );
    });

    testWidgets('should center align text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPELabelChip(
              label: 'Test Label',
              backgroundColor: Colors.blue,
              textColor: Colors.white,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.alignment, equals(Alignment.center));
    });
  });
}
