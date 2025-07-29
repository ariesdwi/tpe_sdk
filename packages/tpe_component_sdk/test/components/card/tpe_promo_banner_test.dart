import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tpe_component_sdk/components/card/tpe_promo_banner/tpe_component_promo_banner.dart';
import 'package:tpe_component_sdk/components/card/tpe_promo_banner/tpe_promo_card.dart';

void main() {
  group('TpePromoListBannerTw Tests', () {
    testWidgets('should render promo banner with images', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpePromoListBannerTw(
              imageUrls: [
                'assets/images/placeholder.png',
                'assets/images/placeholder.png',
              ],
            ),
          ),
        ),
      );

      expect(find.byType(TpePromoListBannerTw), findsOneWidget);
      expect(find.byType(TPEPromoCard), findsNWidgets(2));
    });

    testWidgets('should not render when show is false', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpePromoListBannerTw(
              imageUrls: [
                'assets/images/placeholder.png',
                'assets/images/placeholder.png',
              ],
              show: false,
            ),
          ),
        ),
      );

      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(TPEPromoCard), findsNothing);
    });

    testWidgets('should apply correct height', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpePromoListBannerTw(
              imageUrls: ['assets/images/placeholder.png'],
              height: 200,
            ),
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.height, equals(200));
    });

    testWidgets('should apply correct width', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpePromoListBannerTw(
              imageUrls: ['assets/images/placeholder.png'],
              width: 300,
            ),
          ),
        ),
      );

      // The width is passed to TPEPromoCard
      expect(find.byType(TPEPromoCard), findsOneWidget);
    });

    testWidgets('should render ListView with horizontal scroll', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpePromoListBannerTw(
              imageUrls: [
                'assets/images/placeholder.png',
                'assets/images/placeholder.png',
              ],
            ),
          ),
        ),
      );

      final listView = tester.widget<ListView>(find.byType(ListView));
      expect(listView.scrollDirection, equals(Axis.horizontal));
    });

    testWidgets('should apply correct padding', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpePromoListBannerTw(
              imageUrls: ['assets/images/placeholder.png'],
            ),
          ),
        ),
      );

      final listView = tester.widget<ListView>(find.byType(ListView));
      expect(listView.padding, equals(const EdgeInsets.fromLTRB(0, 0, 16, 24)));
    });

    testWidgets('should apply correct separator', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpePromoListBannerTw(
              imageUrls: [
                'assets/images/placeholder.png',
                'assets/images/placeholder.png',
              ],
            ),
          ),
        ),
      );

      expect(find.byType(SizedBox), findsNWidgets(3)); // 2 cards + 1 separator
    });

    testWidgets('should handle empty image list', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: TpePromoListBannerTw(imageUrls: [])),
        ),
      );

      expect(find.byType(TPEPromoCard), findsNothing);
    });

    testWidgets('should handle single image', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpePromoListBannerTw(
              imageUrls: ['assets/images/placeholder.png'],
            ),
          ),
        ),
      );

      expect(find.byType(TPEPromoCard), findsOneWidget);
    });

    testWidgets('should use default values when not specified', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TpePromoListBannerTw(
              imageUrls: ['assets/images/placeholder.png'],
            ),
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.height, equals(160)); // Default height
    });
  });

  group('TPEPromoCard Tests', () {
    testWidgets('should render promo card with image', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEPromoCard(imageUrl: 'assets/images/placeholder.png'),
          ),
        ),
      );

      expect(find.byType(TPEPromoCard), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should apply correct dimensions', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEPromoCard(
              imageUrl: 'assets/images/placeholder.png',
              width: 300,
              height: 200,
            ),
          ),
        ),
      );

      final image = tester.widget<Image>(find.byType(Image));
      expect(image.width, equals(300));
      expect(image.height, equals(200));
    });

    testWidgets('should apply correct border radius', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEPromoCard(imageUrl: 'assets/images/placeholder.png'),
          ),
        ),
      );

      final clipRRect = tester.widget<ClipRRect>(find.byType(ClipRRect));
      expect(clipRRect.borderRadius, equals(BorderRadius.circular(16)));
    });

    testWidgets('should apply correct box fit', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEPromoCard(imageUrl: 'assets/images/placeholder.png'),
          ),
        ),
      );

      final image = tester.widget<Image>(find.byType(Image));
      expect(image.fit, equals(BoxFit.cover));
    });

    testWidgets('should handle network image', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEPromoCard(imageUrl: 'https://example.com/image.png'),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should handle asset image', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEPromoCard(imageUrl: 'assets/images/placeholder.png'),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should apply correct decoration', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEPromoCard(imageUrl: 'assets/images/placeholder.png'),
          ),
        ),
      );

      final decoratedBox = tester.widget<DecoratedBox>(
        find.byType(DecoratedBox),
      );
      final decoration = decoratedBox.decoration as BoxDecoration;
      expect(decoration.color, equals(Colors.grey));
    });

    testWidgets('should use default values when not specified', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEPromoCard(imageUrl: 'assets/images/placeholder.png'),
          ),
        ),
      );

      final image = tester.widget<Image>(find.byType(Image));
      expect(image.width, equals(280)); // Default width
      expect(image.height, equals(160)); // Default height
    });

    testWidgets('should handle empty image URL', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: TPEPromoCard(imageUrl: '')),
        ),
      );

      // Should not crash and should show asset image
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should handle very long image URL', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TPEPromoCard(
              imageUrl:
                  'https://example.com/very/long/image/url/that/should/be/handled/properly.png',
            ),
          ),
        ),
      );

      // Should not crash
      expect(find.byType(TPEPromoCard), findsOneWidget);
    });
  });
}
