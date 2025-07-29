import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/components/menu/tpe_homepage_transaction_tw.dart';
import 'package:tpe_component_sdk/components/section/tpe_promo_section.dart';
import 'package:tpe_component_sdk/components/section/tpe_transaction_section.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';
import 'package:tpe_homepage_sdk/src/utils/tpe_homepage_background_tw.dart';

class TpeHomepageTWType extends StatelessWidget {
  final String? backgroundImageUrl;
  final TPEHeaderComponent? header;
  final TPEBalanceCardTW? balanceCard;
  final TpeTransactionSection? transactionSection;
  final TpePromoSection? promoSection;
  final TPEMenuListVertical? listMenu;

  const TpeHomepageTWType({
    super.key,
    this.backgroundImageUrl,
    this.header,
    this.balanceCard,
    this.promoSection,
    this.transactionSection,
    this.listMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: TpeHomepageBackgroundTw(imageUrl: backgroundImageUrl),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: header != null ? header! : const SizedBox(height: 16),
          ),
          body: ListView(
            padding: EdgeInsets.zero,
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: FlipRoundedTopClipper(),
                    child: Container(
                      height: 325,
                      decoration: BoxDecoration(color: Colors.white),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (balanceCard != null) ...[
                        balanceCard!,
                        const SizedBox(height: 8),
                      ],
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            if(listMenu!= null) ... [listMenu!, SizedBox(height: 16,)],
                            SizedBox(height: 16),
                            Divider(color: TPEColors.ligth10, thickness: 8),
                            if(transactionSection != null) ... [transactionSection!, const SizedBox(height: 16,)],
                            Divider(color: TPEColors.ligth10, thickness: 8),
                            if(promoSection != null) ... [promoSection!, const SizedBox(height: 16,)],
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FlipRoundedTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    double curveStartY = size.height * 0.3;

    path.lineTo(0, curveStartY);

    // Smooth symmetrical curve
    path.quadraticBezierTo(
      size.width / 2,
      size.height * 0.1,
      size.width,
      curveStartY,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
