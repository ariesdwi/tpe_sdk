import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/components/card/tpe_promo_banner/tpe_promo_card.dart';

class TpePromoListBannerTw extends StatelessWidget {
  final List<String> imageUrls;
  final double? height;
  final double? width;
  final bool show;

  const TpePromoListBannerTw({
    super.key,
    required this.imageUrls,
    this.height = 160,
    this.width = 280,
    this.show = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!show) return const SizedBox.shrink();

    return Container(
      color: Colors.white,
      child: SizedBox(
        height: height,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.fromLTRB(0, 0, 16, 24),
          itemCount: imageUrls.length,
          separatorBuilder: (context, index) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            return TPEPromoCard(
              imageUrl: imageUrls[index],
              width: width,
              height: height,
            );
          },
        ),
      ),
    );
  }
}
