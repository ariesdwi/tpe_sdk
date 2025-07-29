import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tpe_component_sdk/utils/top_modal.dart';

void main() {
  group('TopModal Tests', () {
    group('TopModal.error Tests', () {
      testWidgets('should render error modal with default values', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: TopModal.error(message: 'Error message')),
          ),
        );

        expect(find.text('Error message'), findsOneWidget);
        expect(find.byIcon(Icons.cancel), findsOneWidget);
      });

      testWidgets('should render error modal with custom icon', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TopModal.error(
                message: 'Error message',
                icon: Icon(Icons.warning),
              ),
            ),
          ),
        );

        expect(find.text('Error message'), findsOneWidget);
        expect(find.byIcon(Icons.warning), findsOneWidget);
        expect(find.byIcon(Icons.cancel), findsNothing);
      });

      testWidgets('should render error modal with custom colors', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TopModal.error(
                message: 'Error message',
                backgroundColor: Colors.purple,
                textColor: Colors.yellow,
              ),
            ),
          ),
        );

        expect(find.text('Error message'), findsOneWidget);

        final container = tester.widget<Container>(find.byType(Container));
        final decoration = container.decoration as BoxDecoration;
        expect(decoration.color, equals(Colors.purple));
      });

      testWidgets('should apply correct container styling', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: TopModal.error(message: 'Error message')),
          ),
        );

        final container = tester.widget<Container>(find.byType(Container));
        final decoration = container.decoration as BoxDecoration;

        expect(container.padding, equals(EdgeInsets.all(16.0)));
        final renderBox = tester.renderObject<RenderBox>(find.byType(Container));
        expect(renderBox.size.width, equals(tester.binding.window.physicalSize.width / tester.binding.window.devicePixelRatio));
        expect(decoration.borderRadius, equals(BorderRadius.circular(8.0)));
        expect(
          decoration.color,
          equals(Colors.red),
        ); // Default error background color
      });

      testWidgets('should apply correct row layout', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: TopModal.error(message: 'Error message')),
          ),
        );

        final row = tester.widget<Row>(find.byType(Row));
        expect(row.mainAxisAlignment, equals(MainAxisAlignment.start));
      });

      testWidgets('should apply correct text styling', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: TopModal.error(message: 'Error message')),
          ),
        );

        final text = tester.widget<Text>(find.text('Error message'));
        expect(text.style?.fontSize, equals(14.0));
        expect(text.style?.fontWeight, equals(FontWeight.w600));
        expect(
          text.style?.color,
          equals(Colors.white),
        ); // Default error text color
      });

      testWidgets('should handle long error message', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TopModal.error(
                message:
                    'This is a very long error message that should be displayed properly in the modal',
              ),
            ),
          ),
        );

        expect(
          find.text(
            'This is a very long error message that should be displayed properly in the modal',
          ),
          findsOneWidget,
        );
      });

      testWidgets('should handle empty message', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: TopModal.error(message: '')),
          ),
        );

        expect(find.text(''), findsOneWidget);
      });
    });

    group('TopModal.success Tests', () {
      testWidgets('should render success modal with default values', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: TopModal.success(message: 'Success message')),
          ),
        );

        expect(find.text('Success message'), findsOneWidget);
        expect(find.byIcon(Icons.check_circle), findsOneWidget);
      });

      testWidgets('should render success modal with custom icon', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TopModal.success(
                message: 'Success message',
                icon: Icon(Icons.thumb_up),
              ),
            ),
          ),
        );

        expect(find.text('Success message'), findsOneWidget);
        expect(find.byIcon(Icons.thumb_up), findsOneWidget);
        expect(find.byIcon(Icons.check_circle), findsNothing);
      });

      testWidgets('should render success modal with custom colors', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TopModal.success(
                message: 'Success message',
                backgroundColor: Colors.blue,
                textColor: Colors.white,
              ),
            ),
          ),
        );

        expect(find.text('Success message'), findsOneWidget);

        final container = tester.widget<Container>(find.byType(Container));
        final decoration = container.decoration as BoxDecoration;
        expect(decoration.color, equals(Colors.blue));
      });

      testWidgets('should apply correct container styling for success', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: TopModal.success(message: 'Success message')),
          ),
        );

        final container = tester.widget<Container>(find.byType(Container));
        final decoration = container.decoration as BoxDecoration;

        expect(container.padding, equals(EdgeInsets.all(16.0)));
        // Check that the container expands to the width of its parent by verifying the RenderBox size
        final renderBox = tester.renderObject<RenderBox>(find.byType(Container));
        expect(renderBox.size.width, equals(tester.binding.window.physicalSize.width / tester.binding.window.devicePixelRatio));
        expect(decoration.borderRadius, equals(BorderRadius.circular(8.0)));
        expect(
          decoration.color,
          equals(Colors.green),
        ); // Default success background color
      });

      testWidgets('should apply correct text styling for success', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: TopModal.success(message: 'Success message')),
          ),
        );

        final text = tester.widget<Text>(find.text('Success message'));
        expect(text.style?.fontSize, equals(14.0));
        expect(text.style?.fontWeight, equals(FontWeight.w600));
        expect(
          text.style?.color,
          equals(Colors.white),
        ); // Default success text color
      });

      testWidgets('should handle long success message', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TopModal.success(
                message:
                    'This is a very long success message that should be displayed properly in the modal',
              ),
            ),
          ),
        );

        expect(
          find.text(
            'This is a very long success message that should be displayed properly in the modal',
          ),
          findsOneWidget,
        );
      });

      testWidgets('should handle empty success message', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: TopModal.success(message: '')),
          ),
        );

        expect(find.text(''), findsOneWidget);
      });
    });

    group('TopModal General Tests', () {
      testWidgets('should have correct icon size', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: TopModal.error(message: 'Error message')),
          ),
        );

        final icon = tester.widget<Icon>(find.byIcon(Icons.cancel));
        expect(icon.size, equals(16));
      });

      testWidgets('should have correct spacing between icon and text', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: TopModal.error(message: 'Error message')),
          ),
        );

        final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
        expect(sizedBox.width, equals(16));
      });

      testWidgets('should have expanded text widget', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: TopModal.error(message: 'Error message')),
          ),
        );

        expect(find.byType(Expanded), findsOneWidget);
      });

      testWidgets('should have correct text alignment', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: TopModal.error(message: 'Error message')),
          ),
        );

        final defaultTextStyle = tester.widget<DefaultTextStyle>(
          find.byType(DefaultTextStyle),
        );
        expect(defaultTextStyle.textAlign, equals(TextAlign.start));
      });

      testWidgets('should handle special characters in message', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TopModal.error(
                message: 'Error message with special chars: !@#\$%^&*()',
              ),
            ),
          ),
        );

        expect(
          find.text('Error message with special chars: !@#\$%^&*()'),
          findsOneWidget,
        );
      });

      testWidgets('should handle numbers in message', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TopModal.success(
                message: 'Success: 123 transactions completed',
              ),
            ),
          ),
        );

        expect(
          find.text('Success: 123 transactions completed'),
          findsOneWidget,
        );
      });
    });
  });
}
