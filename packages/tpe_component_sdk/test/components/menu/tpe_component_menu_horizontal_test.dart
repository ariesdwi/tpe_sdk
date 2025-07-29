import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tpe_component_sdk/components/menu/tpe_component_menu_horizontal.dart';

void main() {
  group('TPEHorizontalMenuItem Tests', () {
    testWidgets('should render horizontal menu item with all data', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHorizontalMenuItem(
              icon: Icon(Icons.home),
              title: 'Home',
              subtitle: 'Go to home page',
            ),
          ),
        ),
      );

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Go to home page'), findsOneWidget);
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.chevron_right), findsOneWidget);
    });

    testWidgets('should handle tap when onTap is provided', (
      WidgetTester tester,
    ) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHorizontalMenuItem(
              icon: Icon(Icons.home),
              title: 'Home',
              subtitle: 'Go to home page',
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TPEHorizontalMenuItem));
      expect(tapped, isTrue);
    });

    testWidgets('should not handle tap when onTap is null', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHorizontalMenuItem(
              icon: Icon(Icons.home),
              title: 'Home',
              subtitle: 'Go to home page',
              onTap: null,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TPEHorizontalMenuItem));
      // Should not throw any error
    });

    testWidgets('should apply correct container styling', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHorizontalMenuItem(
              icon: Icon(Icons.home),
              title: 'Home',
              subtitle: 'Go to home page',
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.color, equals(Colors.white));
      expect(decoration.borderRadius, equals(BorderRadius.circular(16)));
      expect(decoration.border?.top.color, equals(const Color(0xFFE5E5E5)));
    });

    testWidgets('should apply correct padding and margin', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHorizontalMenuItem(
              icon: Icon(Icons.home),
              title: 'Home',
              subtitle: 'Go to home page',
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.padding, equals(const EdgeInsets.all(16)));
      expect(
        container.margin,
        equals(const EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
      );
    });

    testWidgets('should apply correct icon container styling', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHorizontalMenuItem(
              icon: Icon(Icons.home),
              title: 'Home',
              subtitle: 'Go to home page',
            ),
          ),
        ),
      );

      final containers = tester.widgetList<Container>(find.byType(Container));
      final iconContainer = containers.elementAt(1);
      final decoration = iconContainer.decoration as BoxDecoration;

      expect(iconContainer.constraints?.maxWidth, equals(48));
      expect(iconContainer.constraints?.maxHeight, equals(48));
      expect(decoration.color, equals(const Color(0xFFE6F3FF)));
      expect(decoration.borderRadius, equals(BorderRadius.circular(12)));
    });

    testWidgets('should apply correct title text style', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHorizontalMenuItem(
              icon: Icon(Icons.home),
              title: 'Home',
              subtitle: 'Go to home page',
            ),
          ),
        ),
      );

      final titleText = tester.widget<Text>(find.text('Home'));
      expect(titleText.style?.fontSize, equals(16));
      expect(titleText.style?.fontWeight, equals(FontWeight.w600));
      expect(titleText.style?.color, equals(Colors.black));
    });

    testWidgets('should apply correct subtitle text style', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHorizontalMenuItem(
              icon: Icon(Icons.home),
              title: 'Home',
              subtitle: 'Go to home page',
            ),
          ),
        ),
      );

      final subtitleText = tester.widget<Text>(find.text('Go to home page'));
      expect(subtitleText.style?.fontSize, equals(13));
      expect(subtitleText.style?.color, equals(Colors.grey));
    });

    testWidgets('should apply correct column alignment', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHorizontalMenuItem(
              icon: Icon(Icons.home),
              title: 'Home',
              subtitle: 'Go to home page',
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
            body: TPEHorizontalMenuItem(
              icon: Icon(Icons.home),
              title: 'Home',
              subtitle: 'Go to home page',
            ),
          ),
        ),
      );

      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('should center icon in container', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHorizontalMenuItem(
              icon: Icon(Icons.home),
              title: 'Home',
              subtitle: 'Go to home page',
            ),
          ),
        ),
      );

      final center = tester.widget<Center>(find.byType(Center));
      expect(center.child, isA<Icon>());
    });

    testWidgets('should show chevron right icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHorizontalMenuItem(
              icon: Icon(Icons.home),
              title: 'Home',
              subtitle: 'Go to home page',
            ),
          ),
        ),
      );

      final chevronIcon = tester.widget<Icon>(find.byIcon(Icons.chevron_right));
      expect(chevronIcon.color, equals(Colors.blue));
    });

    testWidgets('should handle long title text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHorizontalMenuItem(
              icon: Icon(Icons.home),
              title: 'Very Long Title That Should Be Displayed Properly',
              subtitle: 'Go to home page',
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
            body: TPEHorizontalMenuItem(
              icon: Icon(Icons.home),
              title: 'Home',
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
            body: TPEHorizontalMenuItem(
              icon: Icon(Icons.home),
              title: '',
              subtitle: 'Go to home page',
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
            body: TPEHorizontalMenuItem(
              icon: Icon(Icons.home),
              title: 'Home',
              subtitle: '',
            ),
          ),
        ),
      );

      expect(find.text(''), findsOneWidget);
    });

    testWidgets('should handle different icon types', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHorizontalMenuItem(
              icon: Icon(Icons.settings),
              title: 'Settings',
              subtitle: 'Configure app settings',
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.settings), findsOneWidget);
    });

    testWidgets('should handle custom widget as icon', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEHorizontalMenuItem(
              icon: Container(
                width: 24,
                height: 24,
                color: Colors.red,
                child: Text('Custom'),
              ),
              title: 'Custom',
              subtitle: 'Custom icon widget',
            ),
          ),
        ),
      );

      expect(
        find.text('Custom'),
        findsNWidgets(2),
      ); // One in icon, one in title
    });
  });
}
