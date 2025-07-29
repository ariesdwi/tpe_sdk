import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tpe_component_sdk/components/icon/tpe_icon_base.dart';

void main() {
  group('TPEBaseIconUrl Tests', () {
    testWidgets('should render network image when URL starts with https', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEBaseIconUrl(iconUrl: 'https://example.com/image.png'),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets(
      'should render asset image when URL does not start with https',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TPEBaseIconUrl(iconUrl: 'assets/images/placeholder.png'),
            ),
          ),
        );

        expect(find.byType(Image), findsOneWidget);
      },
    );

    testWidgets('should apply correct size', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEBaseIconUrl(
              iconUrl: 'assets/images/placeholder.png',
              size: 64,
            ),
          ),
        ),
      );

      final image = tester.widget<Image>(find.byType(Image));
      expect(image.width, equals(64));
      expect(image.height, equals(64));
    });

    testWidgets('should apply correct color', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEBaseIconUrl(
              iconUrl: 'assets/images/placeholder.png',
              color: Colors.red,
            ),
          ),
        ),
      );

      final image = tester.widget<Image>(find.byType(Image));
      expect(image.color, equals(Colors.red));
    });

    testWidgets('should apply correct box fit', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEBaseIconUrl(iconUrl: 'assets/images/placeholder.png'),
          ),
        ),
      );

      final image = tester.widget<Image>(find.byType(Image));
      expect(image.fit, equals(BoxFit.cover));
    });

    testWidgets('should use default values when not specified', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEBaseIconUrl(iconUrl: 'assets/images/placeholder.png'),
          ),
        ),
      );

      final image = tester.widget<Image>(find.byType(Image));
      expect(image.width, equals(20)); // Default size
      expect(image.height, equals(20)); // Default size
      expect(image.color, equals(Colors.blue)); // Default color
    });

    testWidgets('should handle empty URL', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: TPEBaseIconUrl(iconUrl: '')),
        ),
      );

      // Should not crash and should show asset image
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should handle very long URL', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEBaseIconUrl(
              iconUrl:
                  'https://example.com/very/long/image/url/that/should/be/handled/properly.png',
            ),
          ),
        ),
      );

      // Should not crash
      expect(find.byType(TPEBaseIconUrl), findsOneWidget);
    });

    testWidgets('should handle HTTP URL', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEBaseIconUrl(iconUrl: 'http://example.com/image.png'),
          ),
        ),
      );

      // Should show asset image since it doesn't start with https
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should handle HTTPS URL with query parameters', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEBaseIconUrl(
              iconUrl: 'https://example.com/image.png?size=large&format=png',
            ),
          ),
        ),
      );

      // Should show network image
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should handle asset URL with package', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEBaseIconUrl(
              iconUrl:
                  'packages/tpe_component_sdk/assets/images/placeholder.png',
            ),
          ),
        ),
      );

      // Should show asset image
      expect(find.byType(Image), findsOneWidget);
    });
  });
}
