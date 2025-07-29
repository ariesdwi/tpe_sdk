import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tpe_component_sdk/utils/spacers.dart';

void main() {
  group('SizedBoxExt Tests', () {
    testWidgets('should create SizedBox with height when using .height', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: 16.height)));

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.height, equals(16.0));
      expect(sizedBox.width, isNull);
    });

    testWidgets('should create SizedBox with width when using .width', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: 24.width)));

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.width, equals(24.0));
      expect(sizedBox.height, isNull);
    });

    testWidgets('should handle zero values', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: Column(children: [0.height, 0.width])),
        ),
      );

      final sizedBoxes = tester.widgetList<SizedBox>(find.byType(SizedBox));
      expect(sizedBoxes.length, equals(2));

      expect(sizedBoxes.first.height, equals(0.0));
      expect(sizedBoxes.first.width, isNull);

      expect(sizedBoxes.last.width, equals(0.0));
      expect(sizedBoxes.last.height, isNull);
    });

    testWidgets('should handle negative values', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: Column(children: [(-10).height, (-5).width])),
        ),
      );

      final sizedBoxes = tester.widgetList<SizedBox>(find.byType(SizedBox));
      expect(sizedBoxes.length, equals(2));

      expect(sizedBoxes.first.height, equals(-10.0));
      expect(sizedBoxes.first.width, isNull);

      expect(sizedBoxes.last.width, equals(-5.0));
      expect(sizedBoxes.last.height, isNull);
    });

    testWidgets('should handle decimal values', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: Column(children: [16.5.height, 24.75.width])),
        ),
      );

      final sizedBoxes = tester.widgetList<SizedBox>(find.byType(SizedBox));
      expect(sizedBoxes.length, equals(2));

      expect(sizedBoxes.first.height, equals(16.5));
      expect(sizedBoxes.first.width, isNull);

      expect(sizedBoxes.last.width, equals(24.75));
      expect(sizedBoxes.last.height, isNull);
    });

    testWidgets('should handle large values', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: Column(children: [1000.height, 2000.width])),
        ),
      );

      final sizedBoxes = tester.widgetList<SizedBox>(find.byType(SizedBox));
      expect(sizedBoxes.length, equals(2));

      expect(sizedBoxes.first.height, equals(1000.0));
      expect(sizedBoxes.first.width, isNull);

      expect(sizedBoxes.last.width, equals(2000.0));
      expect(sizedBoxes.last.height, isNull);
    });

    testWidgets('should work with different number types', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                16.height, // int
                24.0.height, // double
                32.5.height, // double with decimal
              ],
            ),
          ),
        ),
      );

      final sizedBoxes = tester.widgetList<SizedBox>(find.byType(SizedBox));
      expect(sizedBoxes.length, equals(3));

      expect(sizedBoxes.elementAt(0).height, equals(16.0));
      expect(sizedBoxes.elementAt(1).height, equals(24.0));
      expect(sizedBoxes.elementAt(2).height, equals(32.5));
    });

    testWidgets('should work in complex widget tree', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                Container(child: 16.height),
                Row(children: [24.width, Text('Test'), 32.width]),
                8.height,
              ],
            ),
          ),
        ),
      );

      final sizedBoxes = tester.widgetList<SizedBox>(find.byType(SizedBox));
      expect(sizedBoxes.length, equals(4));

      // First SizedBox (height)
      expect(sizedBoxes.elementAt(0).height, equals(16.0));
      expect(sizedBoxes.elementAt(0).width, isNull);

      // Second SizedBox (width)
      expect(sizedBoxes.elementAt(1).width, equals(24.0));
      expect(sizedBoxes.elementAt(1).height, isNull);

      // Third SizedBox (width)
      expect(sizedBoxes.elementAt(2).width, equals(32.0));
      expect(sizedBoxes.elementAt(2).height, isNull);

      // Fourth SizedBox (height)
      expect(sizedBoxes.elementAt(3).height, equals(8.0));
      expect(sizedBoxes.elementAt(3).width, isNull);
    });

    testWidgets('should work with Material Design widgets', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                AppBar(title: Text('Test')),
                16.height,
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text('Card Content'),
                        8.height,
                        Text('More Content'),
                      ],
                    ),
                  ),
                ),
                24.height,
              ],
            ),
          ),
        ),
      );

      final sizedBoxes = tester.widgetList<SizedBox>(find.byType(SizedBox));
      expect(sizedBoxes.length, equals(3));

      expect(sizedBoxes.elementAt(0).height, equals(16.0));
      expect(sizedBoxes.elementAt(1).height, equals(8.0));
      expect(sizedBoxes.elementAt(2).height, equals(24.0));
    });
  });
}
