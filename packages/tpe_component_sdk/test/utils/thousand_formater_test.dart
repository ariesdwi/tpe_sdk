import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tpe_component_sdk/utils/thousand_formater.dart';

void main() {
  group('ThousandsSeparatorInputFormatter Tests', () {
    late ThousandsSeparatorInputFormatter formatter;

    setUp(() {
      formatter = ThousandsSeparatorInputFormatter();
    });

    test('should format empty text', () {
      final result = formatter.formatEditUpdate(
        const TextEditingValue(text: ''),
        const TextEditingValue(text: ''),
      );
      expect(result.text, equals(''));
    });

    test('should format single digit', () {
      final result = formatter.formatEditUpdate(
        const TextEditingValue(text: ''),
        const TextEditingValue(text: '5'),
      );
      expect(result.text, equals('5'));
    });

    test('should format number with thousands separator', () {
      final result = formatter.formatEditUpdate(
        const TextEditingValue(text: ''),
        const TextEditingValue(text: '1000'),
      );
      expect(result.text, equals('1,000'));
    });

    test('should format large number with multiple separators', () {
      final result = formatter.formatEditUpdate(
        const TextEditingValue(text: ''),
        const TextEditingValue(text: '1000000'),
      );
      expect(result.text, equals('1,000,000'));
    });

    test('should handle decimal numbers', () {
      final result = formatter.formatEditUpdate(
        const TextEditingValue(text: ''),
        const TextEditingValue(text: '1000.50'),
      );
      expect(result.text, equals('1,000.5'));
    });

    test('should remove non-numeric characters except decimal point', () {
      final result = formatter.formatEditUpdate(
        const TextEditingValue(text: ''),
        const TextEditingValue(text: '1abc000def'),
      );
      expect(result.text, equals('1,000'));
    });

    test('should handle multiple decimal points by keeping only first', () {
      final result = formatter.formatEditUpdate(
        const TextEditingValue(text: ''),
        const TextEditingValue(text: '1000.50.25'),
      );
      expect(result.text, equals('1,000.5'));
    });

    test('should handle invalid input gracefully', () {
      final result = formatter.formatEditUpdate(
        const TextEditingValue(text: ''),
        const TextEditingValue(text: 'abc'),
      );
      expect(result.text, equals(''));
    });

    test('should maintain cursor position', () {
      final result = formatter.formatEditUpdate(
        const TextEditingValue(text: ''),
        const TextEditingValue(
          text: '1000',
          selection: TextSelection.collapsed(offset: 2),
        ),
      );
      expect(result.selection.baseOffset, greaterThan(0));
    });
  });

  group('DotFormatter Tests', () {
    late DotFormatter formatter;

    setUp(() {
      formatter = DotFormatter();
    });

    test('should format empty text', () {
      final result = formatter.formatEditUpdate(
        const TextEditingValue(text: ''),
        const TextEditingValue(text: ''),
      );
      expect(result.text, equals(''));
    });

    test('should format single digit', () {
      final result = formatter.formatEditUpdate(
        const TextEditingValue(text: ''),
        const TextEditingValue(text: '5'),
      );
      expect(result.text, equals('5'));
    });

    test('should format number with thousands separator', () {
      final result = formatter.formatEditUpdate(
        const TextEditingValue(text: ''),
        const TextEditingValue(text: '1000'),
      );
      expect(result.text, equals('1,000'));
    });

    test('should format large number with multiple separators', () {
      final result = formatter.formatEditUpdate(
        const TextEditingValue(text: ''),
        const TextEditingValue(text: '1000000'),
      );
      expect(result.text, equals('1,000,000'));
    });

    test('should remove all non-numeric characters', () {
      final result = formatter.formatEditUpdate(
        const TextEditingValue(text: ''),
        const TextEditingValue(text: '1abc000def'),
      );
      expect(result.text, equals('1,000'));
    });

    test('should handle invalid input gracefully', () {
      final result = formatter.formatEditUpdate(
        const TextEditingValue(text: ''),
        const TextEditingValue(text: 'abc'),
      );
      expect(result.text, equals(''));
    });

    test('should maintain cursor position', () {
      final result = formatter.formatEditUpdate(
        const TextEditingValue(text: ''),
        const TextEditingValue(
          text: '1000',
          selection: TextSelection.collapsed(offset: 2),
        ),
      );
      expect(result.selection.baseOffset, greaterThan(0));
    });
  });

  group('thousandSeparator Tests', () {
    test('should format number with thousands separator', () {
      expect(thousandSeparator('1000'), equals('1,000.00'));
      expect(thousandSeparator('1000000'), equals('1,000,000.00'));
      expect(thousandSeparator('1234567.89'), equals('1,234,567.89'));
    });

    test('should handle negative numbers', () {
      expect(thousandSeparator('-1000'), equals('-1,000.00'));
      expect(thousandSeparator('-1000000'), equals('-1,000,000.00'));
    });

    test('should handle zero', () {
      expect(thousandSeparator('0'), equals('0.00'));
      expect(thousandSeparator('0.0'), equals('0.00'));
    });

    test('should handle decimal numbers', () {
      expect(thousandSeparator('1000.5'), equals('1,000.50'));
      expect(thousandSeparator('1000.55'), equals('1,000.55'));
      expect(thousandSeparator('1000.555'), equals('1,000.56')); // Rounded
    });

    test('should handle numbers with currency symbols', () {
      expect(thousandSeparator('\$1000'), equals('1,000.00'));
      expect(thousandSeparator('1000 USD'), equals('1,000.00'));
    });

    test('should handle invalid input', () {
      expect(thousandSeparator('abc'), equals('0.00'));
      expect(thousandSeparator(''), equals('0.00'));
      expect(thousandSeparator('invalid123'), equals('123.00'));
    });

    test('should handle very large numbers', () {
      expect(thousandSeparator('999999999999'), equals('999,999,999,999.00'));
    });

    test('should handle very small decimal numbers', () {
      expect(thousandSeparator('0.001'), equals('0.00')); // Rounded
      expect(thousandSeparator('0.01'), equals('0.01'));
    });
  });

  group('extractCurrency Tests', () {
    test('should extract currency from beginning of string', () {
      expect(extractCurrency('USD 1000'), equals('USD'));
      expect(extractCurrency('EUR 500'), equals('EUR'));
      expect(extractCurrency('IDR 1000000'), equals('IDR'));
    });

    test('should handle lowercase currency', () {
      expect(extractCurrency('usd 1000'), equals('usd'));
      expect(extractCurrency('eur 500'), equals('eur'));
    });

    test('should handle mixed case currency', () {
      expect(extractCurrency('Usd 1000'), equals('Usd'));
      expect(extractCurrency('Eur 500'), equals('Eur'));
    });

    test('should return empty string for no currency', () {
      expect(extractCurrency('1000'), equals(''));
      expect(extractCurrency(''), equals(''));
      expect(extractCurrency('123 USD'), equals(''));
    });

    test('should handle currency with numbers', () {
      expect(extractCurrency('USD1000'), equals('USD'));
      expect(extractCurrency('EUR500'), equals('EUR'));
    });

    test('should handle currency with special characters', () {
      expect(extractCurrency('USD\$1000'), equals('USD'));
      expect(extractCurrency('EUR€500'), equals('EUR'));
    });

    test('should handle very long currency codes', () {
      expect(
        extractCurrency('VERYLONGCURRENCY 1000'),
        equals('VERYLONGCURRENCY'),
      );
    });

    test('should handle currency with spaces', () {
      expect(extractCurrency('U S D 1000'), equals('U'));
    });
  });
}
