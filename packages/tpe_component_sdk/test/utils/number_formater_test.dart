import 'package:flutter_test/flutter_test.dart';
import 'package:tpe_component_sdk/utils/number_formater.dart';

void main() {
  group('Number Formatter Tests', () {
    group('formatAccountNumber Tests', () {
      test('should format account number with spaces every 4 digits', () {
        expect(formatAccountNumber('1234567890'), equals('1234 5678 90'));
        expect(formatAccountNumber('123456789012'), equals('1234 5678 9012'));
        expect(
          formatAccountNumber('1234567890123456'),
          equals('1234 5678 9012 3456'),
        );
      });

      test('should handle account number with less than 4 digits', () {
        expect(formatAccountNumber('123'), equals('123'));
        expect(formatAccountNumber('12'), equals('12'));
        expect(formatAccountNumber('1'), equals('1'));
      });

      test('should handle account number with exactly 4 digits', () {
        expect(formatAccountNumber('1234'), equals('1234'));
      });

      test('should handle account number with exactly 8 digits', () {
        expect(formatAccountNumber('12345678'), equals('1234 5678'));
      });

      test('should handle empty string', () {
        expect(formatAccountNumber(''), equals(''));
      });

      test('should handle account number with non-numeric characters', () {
        expect(formatAccountNumber('1234-5678-90'), equals('1234 -567 8-90'));
        expect(formatAccountNumber('1234.5678.90'), equals('1234 .567 8.90'));
      });

      test('should handle very long account numbers', () {
        expect(
          formatAccountNumber('123456789012345678901234567890'),
          equals('1234 5678 9012 3456 7890 1234 5678 90'),
        );
      });

      test('should handle account number with spaces already present', () {
        expect(formatAccountNumber('1234 5678 90'), equals('1234  5678  90'));
      });
    });

    group('formatNumberDotToDecimal Tests', () {
      test('should remove commas from number string', () {
        expect(formatNumberDotToDecimal('1,000'), equals('1000'));
        expect(formatNumberDotToDecimal('1,000,000'), equals('1000000'));
        expect(formatNumberDotToDecimal('1,234,567,890'), equals('1234567890'));
      });

      test('should handle number without commas', () {
        expect(formatNumberDotToDecimal('1000'), equals('1000'));
        expect(formatNumberDotToDecimal('1234567890'), equals('1234567890'));
      });

      test('should handle empty string', () {
        expect(formatNumberDotToDecimal(''), equals(''));
      });

      test('should handle number with single comma', () {
        expect(formatNumberDotToDecimal('1,000'), equals('1000'));
      });

      test('should handle number with multiple commas', () {
        expect(formatNumberDotToDecimal('1,000,000,000'), equals('1000000000'));
      });

      test('should handle number with other characters', () {
        expect(formatNumberDotToDecimal('1,000.50'), equals('1000.50'));
        expect(formatNumberDotToDecimal('\$1,000'), equals('\$1000'));
        expect(formatNumberDotToDecimal('1,000 USD'), equals('1000 USD'));
      });

      test('should handle number with only commas', () {
        expect(formatNumberDotToDecimal(','), equals(''));
        expect(formatNumberDotToDecimal(',,'), equals(''));
      });

      test('should handle very large numbers', () {
        expect(
          formatNumberDotToDecimal('999,999,999,999,999'),
          equals('999999999999999'),
        );
      });
    });
  });
}
