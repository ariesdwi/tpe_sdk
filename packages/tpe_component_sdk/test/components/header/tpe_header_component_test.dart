import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tpe_component_sdk/components/header/tpe_header_component.dart';
import 'package:tpe_component_sdk/components/button/tpe_component_circle_button.dart';

void main() {
  group('TPEHeaderComponent Tests', () {
    testWidgets('should render header with user name', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: TPEHeaderComponent(userName: 'John Doe')),
        ),
      );

      expect(find.text('Welcome John Doe'), findsOneWidget);
    });

    testWidgets('should render header with custom greeting', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHeaderComponent(userName: 'John Doe', greeting: 'Hello'),
          ),
        ),
      );

      expect(find.text('Hello John Doe'), findsOneWidget);
    });

    testWidgets('should render single line type by default', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: TPEHeaderComponent(userName: 'John Doe')),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
      expect(find.byType(Column), findsNothing);
    });

    testWidgets('should render multi line type when singleLineType is false', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHeaderComponent(
              userName: 'John Doe',
              singleLineType: false,
            ),
          ),
        ),
      );

      expect(find.byType(Column), findsOneWidget);
      expect(find.text('Welcome'), findsOneWidget);
      expect(find.text('John Doe'), findsOneWidget);
    });

    testWidgets('should show logo when logoUrl is provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHeaderComponent(
              userName: 'John Doe',
              logoUrl: 'https://example.com/logo.png',
            ),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should show default logo when logoUrl is not provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: TPEHeaderComponent(userName: 'John Doe')),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should show right circle button when provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHeaderComponent(
              userName: 'John Doe',
              rightCircleButton: TPECircleIconButton(
                icon: Icons.notifications,
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      expect(find.byType(TPECircleIconButton), findsOneWidget);
    });

    testWidgets('should not show right circle button when not provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: TPEHeaderComponent(userName: 'John Doe')),
        ),
      );

      expect(find.byType(TPECircleIconButton), findsNothing);
    });

    testWidgets('should apply correct text style for single line', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: TPEHeaderComponent(userName: 'John Doe')),
        ),
      );

      final text = tester.widget<Text>(find.byType(Text));
      expect(text.style?.color, equals(Colors.white));
      expect(text.style?.fontSize, equals(16));
      expect(text.style?.fontWeight, equals(FontWeight.w600));
    });

    testWidgets('should apply correct container styling', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: TPEHeaderComponent(userName: 'John Doe')),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.margin, equals(const EdgeInsets.only(top: 16)));
      expect(
        container.padding,
        equals(const EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
      );
    });

    testWidgets('should apply correct row alignment', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: TPEHeaderComponent(userName: 'John Doe')),
        ),
      );

      final row = tester.widget<Row>(find.byType(Row));
      expect(row.mainAxisAlignment, equals(MainAxisAlignment.spaceBetween));
      expect(row.crossAxisAlignment, equals(CrossAxisAlignment.center));
    });

    testWidgets('should handle text overflow in single line mode', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHeaderComponent(
              userName: 'Very Long User Name That Should Be Truncated',
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.byType(Text));
      expect(text.overflow, equals(TextOverflow.ellipsis));
    });

    testWidgets('should use default values when not specified', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: TPEHeaderComponent(userName: 'John Doe')),
        ),
      );

      expect(find.text('Welcome John Doe'), findsOneWidget);
      expect(find.byType(Column), findsNothing);
      expect(find.byType(TPECircleIconButton), findsNothing);
    });

    testWidgets('should handle long user names gracefully', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHeaderComponent(
              userName:
                  'John Doe Smith Johnson Williams Brown Davis Miller Wilson Moore Taylor Anderson Thomas Jackson White Harris Martin Thompson Garcia Martinez Robinson Clark Rodriguez Lewis Lee Walker Hall Allen Young King Wright Lopez Hill Scott Green Adams Baker Gonzalez Nelson Carter Mitchell Perez Roberts Turner Phillips Campbell Parker Evans Edwards Collins Stewart Sanchez Morris Rogers Reed Cook Morgan Bell Murphy Bailey Rivera Cooper Richardson Cox Howard Ward Torres Peterson Gray Ramirez James Watson Brooks Kelly Sanders Price Bennett Wood Barnes Ross Henderson Coleman Jenkins Perry Powell Long Patterson Hughes Flores Washington Butler Simmons Foster Gonzales Bryant Alexander Russell Griffin Diaz Hayes',
            ),
          ),
        ),
      );

      // Should not crash and should handle overflow
      expect(find.byType(TPEHeaderComponent), findsOneWidget);
    });
  });
}
