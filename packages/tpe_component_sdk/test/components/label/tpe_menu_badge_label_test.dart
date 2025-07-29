import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tpe_component_sdk/components/label/tpe_menu_badge_label.dart';

void main() {
  group('TPEMenuBadgeLabel Tests', () {
    testWidgets('should render menu badge label with default text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEMenuBadgeLabel(),
          ),
        ),
      );

      expect(find.text('BARU'), findsOneWidget);
    });

    testWidgets('should render menu badge label with custom text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEMenuBadgeLabel(text: 'NEW'),
          ),
        ),
      );

      expect(find.text('NEW'), findsOneWidget);
    });

    testWidgets('should apply correct background color', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEMenuBadgeLabel(backgroundColor: Colors.blue),
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
            body: TPEMenuBadgeLabel(textColor: Colors.black),
          ),
        ),
      );

      final text = tester.widget<Text>(find.byType(Text));
      expect(text.style?.color, equals(Colors.black));
    });

    testWidgets('should apply correct font size', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEMenuBadgeLabel(fontSize: 14),
          ),
        ),
      );

      final text = tester.widget<Text>(find.byType(Text));
      expect(text.style?.fontSize, equals(14));
    });

    testWidgets('should apply correct font weight', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEMenuBadgeLabel(fontWeight: FontWeight.normal),
          ),
        ),
      );

      final text = tester.widget<Text>(find.byType(Text));
      expect(text.style?.fontWeight, equals(FontWeight.normal));
    });

    testWidgets('should apply correct padding', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEMenuBadgeLabel(
              padding: EdgeInsets.all(8),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.padding, equals(EdgeInsets.all(8)));
    });

    testWidgets('should apply correct border radius', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEMenuBadgeLabel(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.borderRadius, equals(BorderRadius.circular(12)));
    });

    testWidgets('should use default values when not specified', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEMenuBadgeLabel(),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final text = tester.widget<Text>(find.byType(Text));
      final decoration = container.decoration as BoxDecoration;

      expect(find.text('BARU'), findsOneWidget); // Default text
      expect(decoration.color, equals(Colors.red)); // Default backgroundColor
      expect(text.style?.color, equals(Colors.white)); // Default textColor
      expect(text.style?.fontSize, equals(10)); // Default fontSize
      expect(text.style?.fontWeight, equals(FontWeight.bold)); // Default fontWeight
      expect(container.padding, equals(const EdgeInsets.symmetric(horizontal: 6, vertical: 2))); // Default padding
      expect(decoration.borderRadius, equals(const BorderRadius.all(Radius.circular(8)))); // Default borderRadius
    });

    testWidgets('should handle empty text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEMenuBadgeLabel(text: ''),
          ),
        ),
      );

      expect(find.text(''), findsOneWidget);
    });

    testWidgets('should handle long text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEMenuBadgeLabel(text: 'Very Long Badge Text'),
          ),
        ),
      );

      expect(find.text('Very Long Badge Text'), findsOneWidget);
    });

    testWidgets('should handle special characters in text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEMenuBadgeLabel(text: 'NEW!@#\$%'),
          ),
        ),
      );

      expect(find.text('NEW!@#\$%'), findsOneWidget);
    });

    testWidgets('should handle numbers in text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEMenuBadgeLabel(text: '123'),
          ),
        ),
      );

      expect(find.text('123'), findsOneWidget);
    });

    testWidgets('should handle very large font size', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEMenuBadgeLabel(fontSize: 24),
          ),
        ),
      );

      final text = tester.widget<Text>(find.byType(Text));
      expect(text.style?.fontSize, equals(24));
    });

    testWidgets('should handle very small font size', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEMenuBadgeLabel(fontSize: 6),
          ),
        ),
      );

      final text = tester.widget<Text>(find.byType(Text));
      expect(text.style?.fontSize, equals(6));
    });

    testWidgets('should handle large padding', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEMenuBadgeLabel(
              padding: EdgeInsets.all(16),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.padding, equals(EdgeInsets.all(16)));
    });

    testWidgets('should handle zero padding', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEMenuBadgeLabel(
              padding: EdgeInsets.zero,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.padding, equals(EdgeInsets.zero));
    });

    testWidgets('should handle asymmetric padding', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEMenuBadgeLabel(
              padding: EdgeInsets.only(left: 10, right: 5, top: 8, bottom: 12),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.padding, equals(EdgeInsets.only(left: 10, right: 5, top: 8, bottom: 12)));
    });

    testWidgets('should handle different border radius values', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEMenuBadgeLabel(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.borderRadius, equals(BorderRadius.only(
        topLeft: Radius.circular(4),
        topRight: Radius.circular(8),
        bottomLeft: Radius.circular(12),
        bottomRight: Radius.circular(16),
      )));
    });

    testWidgets('should handle zero border radius', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEMenuBadgeLabel(
              borderRadius: BorderRadius.zero,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.borderRadius, equals(BorderRadius.zero));
    });
  });
} 