import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEBaseBalanceCard extends StatelessWidget {
  final Widget? child;
  final Color backgroundColor;
  final String? backgroundImage;
  final double borderRadius;
  final double? width;
  final double? height;
  final EdgeInsets padding;
  final EdgeInsets? margin;
  final VoidCallback? onTap;

  const TPEBaseBalanceCard({
    super.key,
    this.child,
    this.backgroundColor = TPEColors.white,
    this.backgroundImage,
    this.borderRadius = 16,
    this.width,
    this.height,
    this.padding = const EdgeInsets.all(16),
    this.margin = const EdgeInsets.all(16),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: backgroundColor,
              image: backgroundImage != null
                  ? DecorationImage(
                      image: backgroundImage!.startsWith('http')
                          ? NetworkImage(backgroundImage!)
                          : AssetImage(
                                  backgroundImage!,
                                  package: 'tpe_component_sdk',
                                )
                                as ImageProvider,
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
