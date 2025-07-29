import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tpe_component_sdk/components/section/tpe_component_section_header.dart';
import 'package:tpe_component_sdk/components/icon/tpe_icon_base.dart';

void main() {
  group('TpeComponentSectionHeader Tests', () {
    testWidgets('should render section header with title and subtitle', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeComponentSectionHeader(
              title: 'Test Title',
              subtitle: 'Test Subtitle',
            ),
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Subtitle'), findsOneWidget);
    });

    testWidgets('should handle tap when onTap is provided', (
      WidgetTester tester,
    ) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeComponentSectionHeader(
              title: 'Test Title',
              subtitle: 'Test Subtitle',
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TpeComponentSectionHeader));
      expect(tapped, isTrue);
    });

    testWidgets('should not handle tap when onTap is null', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeComponentSectionHeader(
              title: 'Test Title',
              subtitle: 'Test Subtitle',
              onTap: null,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TpeComponentSectionHeader));
      // Should not throw any error
    });

    testWidgets('should show leading icon when provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeComponentSectionHeader(
              title: 'Test Title',
              subtitle: 'Test Subtitle',
              leadingIcon: TPEBaseIconUrl(
                iconUrl: 'assets/images/placeholder.png',
              ),
            ),
          ),
        ),
      );

      expect(find.byType(TPEBaseIconUrl), findsOneWidget);
    });

    testWidgets('should not show leading icon when not provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeComponentSectionHeader(
              title: 'Test Title',
              subtitle: 'Test Subtitle',
            ),
          ),
        ),
      );

      expect(find.byType(TPEBaseIconUrl), findsNothing);
    });

    testWidgets('should show trailing icon when provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeComponentSectionHeader(
              title: 'Test Title',
              subtitle: 'Test Subtitle',
              trailingIcon: Icon(Icons.arrow_forward),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
    });

    testWidgets('should not show trailing icon when not provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeComponentSectionHeader(
              title: 'Test Title',
              subtitle: 'Test Subtitle',
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.arrow_forward), findsNothing);
    });

    testWidgets('should apply correct title text style', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeComponentSectionHeader(
              title: 'Test Title',
              subtitle: 'Test Subtitle',
            ),
          ),
        ),
      );

      final titleText = tester.widget<Text>(find.text('Test Title'));
      expect(titleText.style?.fontSize, equals(16));
      expect(titleText.style?.fontWeight, equals(FontWeight.bold));
      expect(titleText.style?.color, equals(Colors.black));
    });

    testWidgets('should apply correct subtitle text style', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeComponentSectionHeader(
              title: 'Test Title',
              subtitle: 'Test Subtitle',
            ),
          ),
        ),
      );

      final subtitleText = tester.widget<Text>(find.text('Test Subtitle'));
      expect(subtitleText.style?.fontSize, equals(14));
      expect(subtitleText.style?.color, equals(Colors.grey));
    });

    testWidgets('should apply correct container styling', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeComponentSectionHeader(
              title: 'Test Title',
              subtitle: 'Test Subtitle',
            ),
          ),
        ),
      );

      final material = tester.widget<Material>(find.byType(Material));
      expect(material.color, equals(Colors.white));
    });

    testWidgets('should apply correct padding', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeComponentSectionHeader(
              title: 'Test Title',
              subtitle: 'Test Subtitle',
            ),
          ),
        ),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(
        padding.padding,
        equals(const EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
      );
    });

    testWidgets('should apply correct border radius to InkWell', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeComponentSectionHeader(
              title: 'Test Title',
              subtitle: 'Test Subtitle',
            ),
          ),
        ),
      );

      final inkWell = tester.widget<InkWell>(find.byType(InkWell).first);
      expect(inkWell.borderRadius, equals(BorderRadius.circular(16)));
    });

    testWidgets('should apply correct leading icon container styling', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeComponentSectionHeader(
              title: 'Test Title',
              subtitle: 'Test Subtitle',
              leadingIcon: TPEBaseIconUrl(
                iconUrl: 'assets/images/placeholder.png',
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.shape, equals(BoxShape.circle));
      expect(decoration.color, equals(const Color(0xFFE3F2FD)));
      expect(container.padding, equals(const EdgeInsets.all(8)));
    });

    testWidgets('should apply correct trailing icon container styling', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeComponentSectionHeader(
              title: 'Test Title',
              subtitle: 'Test Subtitle',
              trailingIcon: Icon(Icons.arrow_forward),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).last);
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.shape, equals(BoxShape.circle));
      expect(decoration.color, equals(const Color(0xFFE3F2FD)));
      expect(container.constraints?.maxWidth, equals(36));
      expect(container.constraints?.maxHeight, equals(36));
    });

    testWidgets('should apply correct column alignment', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeComponentSectionHeader(
              title: 'Test Title',
              subtitle: 'Test Subtitle',
            ),
          ),
        ),
      );

      final column = tester.widget<Column>(find.byType(Column));
      expect(column.crossAxisAlignment, equals(CrossAxisAlignment.start));
    });

    testWidgets('should apply correct row layout', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeComponentSectionHeader(
              title: 'Test Title',
              subtitle: 'Test Subtitle',
            ),
          ),
        ),
      );

      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('should handle long title text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeComponentSectionHeader(
              title: 'Very Long Title That Should Be Displayed Properly',
              subtitle: 'Test Subtitle',
            ),
          ),
        ),
      );

      expect(
        find.text('Very Long Title That Should Be Displayed Properly'),
        findsOneWidget,
      );
    });

    testWidgets('should handle long subtitle text', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeComponentSectionHeader(
              title: 'Test Title',
              subtitle: 'Very Long Subtitle That Should Be Displayed Properly',
            ),
          ),
        ),
      );

      expect(
        find.text('Very Long Subtitle That Should Be Displayed Properly'),
        findsOneWidget,
      );
    });

    testWidgets('should handle empty title', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeComponentSectionHeader(
              title: '',
              subtitle: 'Test Subtitle',
            ),
          ),
        ),
      );

      expect(find.text(''), findsOneWidget);
    });

    testWidgets('should handle empty subtitle', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpeComponentSectionHeader(title: 'Test Title', subtitle: ''),
          ),
        ),
      );

      expect(find.text(''), findsOneWidget);
    });
  });
}
