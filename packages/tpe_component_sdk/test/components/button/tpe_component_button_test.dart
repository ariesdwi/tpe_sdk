import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tpe_component_sdk/components/button/tpe_component_button.dart';

void main() {
  group('TPERefineButton Tests', () {
    testWidgets('should render button with title', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPERefineButton(
              title: 'Test Button',
              variant: TPEButtonVariant.primary,
              size: TPEButtonSize.medium,
              roundType: TPEButtonRound.rounded,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('should render button with icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPERefineButton(
              title: 'Test Button',
              icon: Icons.add,
              variant: TPEButtonVariant.primary,
              size: TPEButtonSize.medium,
              roundType: TPEButtonRound.rounded,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('should render loading state', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPERefineButton(
              title: 'Test Button',
              variant: TPEButtonVariant.primary,
              size: TPEButtonSize.medium,
              roundType: TPEButtonRound.rounded,
              isLoading: true,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should handle tap when enabled', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPERefineButton(
              title: 'Test Button',
              variant: TPEButtonVariant.primary,
              size: TPEButtonSize.medium,
              roundType: TPEButtonRound.rounded,
              onPressed: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TPERefineButton));
      expect(tapped, isTrue);
    });

    testWidgets('should not handle tap when disabled', (
      WidgetTester tester,
    ) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPERefineButton(
              title: 'Test Button',
              variant: TPEButtonVariant.primary,
              size: TPEButtonSize.medium,
              roundType: TPEButtonRound.rounded,
              isEnabled: false,
              onPressed: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TPERefineButton));
      expect(tapped, isFalse);
    });

    testWidgets('should not handle tap when loading', (
      WidgetTester tester,
    ) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPERefineButton(
              title: 'Test Button',
              variant: TPEButtonVariant.primary,
              size: TPEButtonSize.medium,
              roundType: TPEButtonRound.rounded,
              isLoading: true,
              onPressed: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TPERefineButton));
      expect(tapped, isFalse);
    });

    testWidgets('should apply correct styles for primary variant', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPERefineButton(
              title: 'Test Button',
              variant: TPEButtonVariant.primary,
              size: TPEButtonSize.medium,
              roundType: TPEButtonRound.rounded,
              onPressed: () {},
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.color, equals(Colors.blue));
      expect(decoration.borderRadius, equals(BorderRadius.circular(8)));
    });

    testWidgets('should apply correct styles for outline variant', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPERefineButton(
              title: 'Test Button',
              variant: TPEButtonVariant.outline,
              size: TPEButtonSize.medium,
              roundType: TPEButtonRound.rounded,
              onPressed: () {},
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.color, equals(Colors.transparent));
      expect(decoration.border?.top.width, equals(1.0));
    });

    testWidgets('should apply correct height for different sizes', (
      WidgetTester tester,
    ) async {
      // Test medium size
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPERefineButton(
              title: 'Test Button',
              variant: TPEButtonVariant.primary,
              size: TPEButtonSize.medium,
              roundType: TPEButtonRound.rounded,
              onPressed: () {},
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.constraints?.maxHeight, equals(44));

      // Test small size
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPERefineButton(
              title: 'Test Button',
              variant: TPEButtonVariant.primary,
              size: TPEButtonSize.small,
              roundType: TPEButtonRound.rounded,
              onPressed: () {},
            ),
          ),
        ),
      );

      final container2 = tester.widget<Container>(find.byType(Container).first);
      expect(container2.constraints?.maxHeight, equals(32));
    });

    testWidgets(
      'should apply correct border radius for different round types',
      (WidgetTester tester) async {
        // Test pill round type
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TPERefineButton(
                title: 'Test Button',
                variant: TPEButtonVariant.primary,
                size: TPEButtonSize.medium,
                roundType: TPEButtonRound.pill,
                onPressed: () {},
              ),
            ),
          ),
        );

        final container = tester.widget<Container>(
          find.byType(Container).first,
        );
        final decoration = container.decoration as BoxDecoration;
        expect(
          decoration.borderRadius,
          equals(BorderRadius.circular(22)),
        ); // height/2 = 44/2 = 22

        // Test rounded round type
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TPERefineButton(
                title: 'Test Button',
                variant: TPEButtonVariant.primary,
                size: TPEButtonSize.medium,
                roundType: TPEButtonRound.rounded,
                onPressed: () {},
              ),
            ),
          ),
        );

        final container2 = tester.widget<Container>(
          find.byType(Container).first,
        );
        final decoration2 = container2.decoration as BoxDecoration;
        expect(decoration2.borderRadius, equals(BorderRadius.circular(8)));
      },
    );
  });
}
