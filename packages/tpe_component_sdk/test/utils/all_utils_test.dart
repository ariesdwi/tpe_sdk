import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tpe_component_sdk/utils/number_formater.dart';
import 'package:tpe_component_sdk/utils/spacers.dart';
import 'package:tpe_component_sdk/utils/thousand_formater.dart';
import 'package:tpe_component_sdk/utils/top_modal.dart';

void main() {
  group('All Utils Tests', () {
    group('Number Formatter Tests', () {
      test('formatAccountNumber should format correctly', () {
        expect(formatAccountNumber('1234567890'), equals('1234 5678 90'));
        expect(formatAccountNumber('123456789012'), equals('1234 5678 9012'));
        expect(formatAccountNumber('1234'), equals('1234'));
        expect(formatAccountNumber(''), equals(''));
      });

      test('formatNumberDotToDecimal should remove commas', () {
        expect(formatNumberDotToDecimal('1,000'), equals('1000'));
        expect(formatNumberDotToDecimal('1,000,000'), equals('1000000'));
        expect(formatNumberDotToDecimal(''), equals(''));
      });
    });

    group('Spacers Tests', () {
      testWidgets('should create SizedBox with height', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(MaterialApp(home: Scaffold(body: 16.height)));

        final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
        expect(sizedBox.height, equals(16.0));
        expect(sizedBox.width, isNull);
      });

      testWidgets('should create SizedBox with width', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(MaterialApp(home: Scaffold(body: 24.width)));

        final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
        expect(sizedBox.width, equals(24.0));
        expect(sizedBox.height, isNull);
      });
    });

    group('Thousand Formatter Tests', () {
      test('thousandSeparator should format numbers', () {
        expect(thousandSeparator('1000'), equals('1,000.00'));
        expect(thousandSeparator('1000000'), equals('1,000,000.00'));
        expect(thousandSeparator('0'), equals('0.00'));
      });

      test('extractCurrency should extract currency codes', () {
        expect(extractCurrency('USD 1000'), equals('USD'));
        expect(extractCurrency('EUR 500'), equals('EUR'));
        expect(extractCurrency('1000'), equals(''));
      });
    });

    group('Top Modal Tests', () {
      testWidgets('should render error modal', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: TopModal.error(message: 'Error message')),
          ),
        );

        expect(find.text('Error message'), findsOneWidget);
        expect(find.byIcon(Icons.cancel), findsOneWidget);
      });

      testWidgets('should render success modal', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: TopModal.success(message: 'Success message')),
          ),
        );

        expect(find.text('Success message'), findsOneWidget);
        expect(find.byIcon(Icons.check_circle), findsOneWidget);
      });

      testWidgets('should apply correct styling', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: TopModal.error(message: 'Error message')),
          ),
        );

        final container = tester.widget<Container>(find.byType(Container));
        final decoration = container.decoration as BoxDecoration;

        expect(container.padding, equals(EdgeInsets.all(16.0)));
        expect(decoration.borderRadius, equals(BorderRadius.circular(8.0)));
        expect(decoration.color, equals(Colors.red));
      });
    });
  });
}
