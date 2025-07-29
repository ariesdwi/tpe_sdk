import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/foundations/color_utils.dart';

class TpeHomepageBackgroundTw extends StatelessWidget {
  final bool show;
  final Color? backgroundColor;
  final String? imageUrl;

  const TpeHomepageBackgroundTw({
    super.key,
    this.show = true,
    this.backgroundColor,
    this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    if (!show) return const SizedBox.shrink();

    return Container(
      color: backgroundColor ?? TPEColors.primaryBlue,
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              imageUrl ?? 'assets/images/Background-Pattern.png',
              package: 'tpe_homepage_sdk',
            ),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}
