import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tpe_component_sdk/components/card/tpe_balance_card/tpe_balance_card.dart';
import 'package:tpe_component_sdk/components/card/tpe_base_balance_card/tpe_base_balance_card.dart';
import 'package:tpe_component_sdk/foundations/tpe_text_variant.dart';

void main() {
  group('TPEBalanceCard Tests', () {
    testWidgets('should render TL balance card', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEBalanceCard(
              type: TPEBalanceCardType.tl,
              accountNumber: '1234567890',
              currency: 'TL',
              currentBalance: 1000.0,
            ),
          ),
        ),
      );

      expect(find.byType(TPEBalanceCard), findsOneWidget);
    });

    testWidgets('should render TW balance card', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEBalanceCard(
              type: TPEBalanceCardType.tw,
              accountNumber: '1234567890',
              currency: 'TW',
              currentBalance: 1000.0,
            ),
          ),
        ),
      );

      expect(find.byType(TPEBalanceCard), findsOneWidget);
    });

    testWidgets('should display account number', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEBalanceCard(
              type: TPEBalanceCardType.tw,
              accountNumber: '1234567890',
              currency: 'TW',
              currentBalance: 1000.0,
            ),
          ),
        ),
      );

      expect(find.textContaining('1234567890'), findsOneWidget);
    });

    testWidgets('should display currency', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEBalanceCard(
              type: TPEBalanceCardType.tw,
              accountNumber: '1234567890',
              currency: 'USD',
              currentBalance: 1000.0,
            ),
          ),
        ),
      );

      expect(find.text('USD'), findsOneWidget);
    });

    testWidgets('should display balance when visible', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEBalanceCard(
              type: TPEBalanceCardType.tw,
              accountNumber: '1234567890',
              currency: 'USD',
              currentBalance: 1000.50,
            ),
          ),
        ),
      );

      // Initially balance should be hidden (showing indicator)
      expect(find.text('1000.50'), findsNothing);

      // Tap the eye toggle button to show balance
      await tester.tap(find.byType(GestureDetector).last);
      await tester.pump();

      expect(find.text('1000.50'), findsOneWidget);
    });

    testWidgets('should handle onSeeAll callback', (WidgetTester tester) async {
      bool seeAllTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEBalanceCard(
              type: TPEBalanceCardType.tw,
              accountNumber: '1234567890',
              currency: 'USD',
              currentBalance: 1000.0,
              onSeeAll: () => seeAllTapped = true,
            ),
          ),
        ),
      );

      // Find and tap the "Lihat semua akun" button
      await tester.tap(find.text('Lihat semua akun'));
      expect(seeAllTapped, isTrue);
    });

    testWidgets('should not show see all button when onSeeAll is null', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEBalanceCard(
              type: TPEBalanceCardType.tw,
              accountNumber: '1234567890',
              currency: 'USD',
              currentBalance: 1000.0,
            ),
          ),
        ),
      );

      expect(find.text('Lihat semua akun'), findsNothing);
    });

    testWidgets('should show loading state', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEBalanceCard(
              type: TPEBalanceCardType.tw,
              accountNumber: '1234567890',
              currency: 'USD',
              currentBalance: 1000.0,
              isLoading: true,
            ),
          ),
        ),
      );

      // Should show skeleton loading
      expect(find.byType(Skeletonizer), findsOneWidget);
    });

    testWidgets('should apply custom background color', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEBalanceCardTW(
              accountNumber: '1234567890',
              currency: 'USD',
              currentBalance: 1000.0,
              backgroundColor: Colors.red,
            ),
          ),
        ),
      );

      // The background color should be applied to the base card
      expect(find.byType(TPEBaseBalanceCard), findsOneWidget);
    });

    testWidgets('should apply custom text colors', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEBalanceCardTW(
              accountNumber: '1234567890',
              currency: 'USD',
              currentBalance: 1000.0,
              accountNumberTextColor: Colors.green,
              currencyTextColor: Colors.blue,
              currentBalanceTextColor: Colors.purple,
            ),
          ),
        ),
      );

      // The custom colors should be applied to the respective text widgets
      expect(find.byType(TPEBaseBalanceCard), findsOneWidget);
    });

    testWidgets('should show custom divider when provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEBalanceCardTW(
              accountNumber: '1234567890',
              currency: 'USD',
              currentBalance: 1000.0,
              divider: const Divider(color: Colors.red, thickness: 2),
            ),
          ),
        ),
      );

      // Should show custom divider instead of default
      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('should show default divider when not provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEBalanceCardTW(
              accountNumber: '1234567890',
              currency: 'USD',
              currentBalance: 1000.0,
            ),
          ),
        ),
      );

      // Should show default divider
      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('should show custom title text when provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEBalanceCardTW(
              accountNumber: '1234567890',
              currency: 'USD',
              currentBalance: 1000.0,
              titleBalanceText: const TPEText(
                text: 'Custom Title',
                variant: TPETextVariant.primary,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Custom Title'), findsOneWidget);
    });

    testWidgets('should show default title text when not provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEBalanceCardTW(
              accountNumber: '1234567890',
              currency: 'USD',
              currentBalance: 1000.0,
            ),
          ),
        ),
      );

      expect(find.text('Saldo Rekening Utama'), findsOneWidget);
    });

    testWidgets('should toggle balance visibility', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEBalanceCardTW(
              accountNumber: '1234567890',
              currency: 'USD',
              currentBalance: 1000.50,
            ),
          ),
        ),
      );

      // Initially balance should be hidden
      expect(find.text('1000.50'), findsNothing);

      // Tap eye toggle button
      await tester.tap(find.byType(GestureDetector).last);
      await tester.pump();

      // Balance should be visible
      expect(find.text('1000.50'), findsOneWidget);

      // Tap again to hide
      await tester.tap(find.byType(GestureDetector).last);
      await tester.pump();

      // Balance should be hidden again
      expect(find.text('1000.50'), findsNothing);
    });
  });
}
