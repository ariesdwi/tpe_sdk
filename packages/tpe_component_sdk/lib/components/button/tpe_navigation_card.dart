
import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/foundations/tpe_text_variant.dart';
import 'package:tpe_component_sdk/foundations/color_utils.dart';

class TPENavigationCardButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? iconColor;

  const TPENavigationCardButton({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(top: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: backgroundColor ?? TPEColors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TPEText(
                text: text,
                variant: TPETextVariant.secondary,
              ),
              Icon(Icons.arrow_forward_rounded, color: iconColor)
            ],
          ),
        ),
      ),
    );
  }
}
