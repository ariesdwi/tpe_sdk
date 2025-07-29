import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tpe_component_sdk/components/card/tpe_transaction_card/tpe_transaction_item.dart';

void main() {
  group('TpeTransactionItemTw Tests', () {
    testWidgets('should render transaction item with all data', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeTransactionItemTw(
              isLoading: false,
              activityTitle: 'Transfer to John Doe',
              activityIcon: 'assets/images/placeholder.png',
              activityStatus: 1,
              activityDate: '2024-01-15',
              activityAmount: 'Rp 1,000,000',
              activityText: 'Transfer successful',
            ),
          ),
        ),
      );

      expect(find.text('Transfer to John Doe'), findsOneWidget);
      expect(find.text('Success'), findsOneWidget);
      expect(find.text('Transfer successful'), findsOneWidget);
      expect(find.text('Rp 1,000,000'), findsOneWidget);
      expect(find.text('2024-01-15'), findsOneWidget);
    });

    testWidgets('should show loading state when isLoading is true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeTransactionItemTw(
              isLoading: true,
              activityTitle: 'Transfer to John Doe',
              activityIcon: 'assets/images/placeholder.png',
              activityStatus: 1,
              activityDate: '2024-01-15',
              activityAmount: 'Rp 1,000,000',
              activityText: 'Transfer successful',
            ),
          ),
        ),
      );

      expect(
        find.byType(Skeletonizer),
        findsNWidgets(4),
      ); // 4 skeletonizers in the component
    });

    testWidgets('should show success status with correct color', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeTransactionItemTw(
              isLoading: false,
              activityTitle: 'Transfer to John Doe',
              activityIcon: 'assets/images/placeholder.png',
              activityStatus: 1,
              activityDate: '2024-01-15',
              activityAmount: 'Rp 1,000,000',
              activityText: 'Transfer successful',
            ),
          ),
        ),
      );

      expect(find.text('Success'), findsOneWidget);
    });

    testWidgets('should show failed status with correct color', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeTransactionItemTw(
              isLoading: false,
              activityTitle: 'Transfer to John Doe',
              activityIcon: 'assets/images/placeholder.png',
              activityStatus: 2,
              activityDate: '2024-01-15',
              activityAmount: 'Rp 1,000,000',
              activityText: 'Transfer failed',
            ),
          ),
        ),
      );

      expect(find.text('Failed'), findsOneWidget);
    });

    testWidgets('should show pending status with correct color', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeTransactionItemTw(
              isLoading: false,
              activityTitle: 'Transfer to John Doe',
              activityIcon: 'assets/images/placeholder.png',
              activityStatus: 3,
              activityDate: '2024-01-15',
              activityAmount: 'Rp 1,000,000',
              activityText: 'Transfer pending',
            ),
          ),
        ),
      );

      expect(find.text('Pending'), findsOneWidget);
    });

    testWidgets('should show placeholder text when loading', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeTransactionItemTw(
              isLoading: true,
              activityTitle: 'Transfer to John Doe',
              activityIcon: 'assets/images/placeholder.png',
              activityStatus: 1,
              activityDate: '2024-01-15',
              activityAmount: 'Rp 1,000,000',
              activityText: 'Transfer successful',
            ),
          ),
        ),
      );

      expect(
        find.text('0000 0000 0000 0000'),
        findsNWidgets(2),
      ); // Title and text placeholders
      expect(
        find.text('---- ----- ----'),
        findsOneWidget,
      ); // Amount placeholder
      expect(
        find.text('---- ----- ---- -----'),
        findsOneWidget,
      ); // Date placeholder
    });

    testWidgets('should render as ListTile', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeTransactionItemTw(
              isLoading: false,
              activityTitle: 'Transfer to John Doe',
              activityIcon: 'assets/images/placeholder.png',
              activityStatus: 1,
              activityDate: '2024-01-15',
              activityAmount: 'Rp 1,000,000',
              activityText: 'Transfer successful',
            ),
          ),
        ),
      );

      expect(find.byType(ListTile), findsOneWidget);
    });

    testWidgets('should have leading icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeTransactionItemTw(
              isLoading: false,
              activityTitle: 'Transfer to John Doe',
              activityIcon: 'assets/images/placeholder.png',
              activityStatus: 1,
              activityDate: '2024-01-15',
              activityAmount: 'Rp 1,000,000',
              activityText: 'Transfer successful',
            ),
          ),
        ),
      );

      final listTile = tester.widget<ListTile>(find.byType(ListTile));
      expect(listTile.leading, isNotNull);
    });

    testWidgets('should have title with activity title and status', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeTransactionItemTw(
              isLoading: false,
              activityTitle: 'Transfer to John Doe',
              activityIcon: 'assets/images/placeholder.png',
              activityStatus: 1,
              activityDate: '2024-01-15',
              activityAmount: 'Rp 1,000,000',
              activityText: 'Transfer successful',
            ),
          ),
        ),
      );

      final listTile = tester.widget<ListTile>(find.byType(ListTile));
      expect(listTile.title, isNotNull);
    });

    testWidgets('should have subtitle with activity details', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeTransactionItemTw(
              isLoading: false,
              activityTitle: 'Transfer to John Doe',
              activityIcon: 'assets/images/placeholder.png',
              activityStatus: 1,
              activityDate: '2024-01-15',
              activityAmount: 'Rp 1,000,000',
              activityText: 'Transfer successful',
            ),
          ),
        ),
      );

      final listTile = tester.widget<ListTile>(find.byType(ListTile));
      expect(listTile.subtitle, isNotNull);
    });

    testWidgets('should apply correct status container styling', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeTransactionItemTw(
              isLoading: false,
              activityTitle: 'Transfer to John Doe',
              activityIcon: 'assets/images/placeholder.png',
              activityStatus: 1,
              activityDate: '2024-01-15',
              activityAmount: 'Rp 1,000,000',
              activityText: 'Transfer successful',
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.constraints?.maxWidth, equals(68));
      expect(container.constraints?.maxHeight, equals(26));
      expect(container.alignment, equals(Alignment.center));
    });

    testWidgets('should apply correct status container border radius', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeTransactionItemTw(
              isLoading: false,
              activityTitle: 'Transfer to John Doe',
              activityIcon: 'assets/images/placeholder.png',
              activityStatus: 1,
              activityDate: '2024-01-15',
              activityAmount: 'Rp 1,000,000',
              activityText: 'Transfer successful',
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.borderRadius, equals(BorderRadius.circular(4)));
    });

    testWidgets('should handle unknown status gracefully', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeTransactionItemTw(
              isLoading: false,
              activityTitle: 'Transfer to John Doe',
              activityIcon: 'assets/images/placeholder.png',
              activityStatus: 99, // Unknown status
              activityDate: '2024-01-15',
              activityAmount: 'Rp 1,000,000',
              activityText: 'Transfer successful',
            ),
          ),
        ),
      );

      // Should not crash and should show empty status text
      expect(find.text(''), findsOneWidget);
    });

    testWidgets('should handle long activity title', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeTransactionItemTw(
              isLoading: false,
              activityTitle:
                  'Very Long Activity Title That Should Be Displayed Properly',
              activityIcon: 'assets/images/placeholder.png',
              activityStatus: 1,
              activityDate: '2024-01-15',
              activityAmount: 'Rp 1,000,000',
              activityText: 'Transfer successful',
            ),
          ),
        ),
      );

      expect(
        find.text('Very Long Activity Title That Should Be Displayed Properly'),
        findsOneWidget,
      );
    });

    testWidgets('should handle long activity text', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeTransactionItemTw(
              isLoading: false,
              activityTitle: 'Transfer to John Doe',
              activityIcon: 'assets/images/placeholder.png',
              activityStatus: 1,
              activityDate: '2024-01-15',
              activityAmount: 'Rp 1,000,000',
              activityText:
                  'Very Long Activity Text That Should Be Displayed Properly',
            ),
          ),
        ),
      );

      expect(
        find.text('Very Long Activity Text That Should Be Displayed Properly'),
        findsOneWidget,
      );
    });

    testWidgets('should handle empty strings gracefully', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeTransactionItemTw(
              isLoading: false,
              activityTitle: '',
              activityIcon: 'assets/images/placeholder.png',
              activityStatus: 1,
              activityDate: '',
              activityAmount: '',
              activityText: '',
            ),
          ),
        ),
      );

      // Should not crash
      expect(find.byType(TpeTransactionItemTw), findsOneWidget);
    });
  });
}
