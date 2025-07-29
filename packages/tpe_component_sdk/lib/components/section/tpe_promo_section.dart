import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TpePromoSection extends StatelessWidget {
  final TpeComponentSectionHeader? sectionHeaderPromo;
  final TpePromoListBannerTw promoBannerTw;

  const TpePromoSection({
    super.key,
    this.sectionHeaderPromo,
    required this.promoBannerTw,
  });

  @override
  Widget build(BuildContext context) {
    if (sectionHeaderPromo == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (sectionHeaderPromo != null) ...[
          sectionHeaderPromo!,
          const SizedBox(height: 16),
        ],
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: promoBannerTw,
        ),
      ],
    );
  }
}
