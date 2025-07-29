import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

enum TPETextVariant {
  primary,
  secondary,
  text12bold,
  text14SemiBold600,
  text14SemiBold700,
  text16SemiBold600,
  text16Bold,
  text20SemiBold700,
}

class TPEText extends StatelessWidget {
  final String text;
  final TPETextVariant variant;
  final TextStyle? styleOverride;
  final Color? color;

  const TPEText({
    super.key,
    required this.text,
    this.variant = TPETextVariant.primary,
    this.styleOverride,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final defaultStyle = _getDefaultStyle(context);
    final effectiveStyle = (styleOverride ?? defaultStyle).copyWith(
      color: color ?? (styleOverride?.color ?? defaultStyle.color),
    );
    return Text(text, style: effectiveStyle);
  }

  TextStyle _getDefaultStyle(BuildContext context) {
    switch (variant) {
      case TPETextVariant.secondary:
        return TextStyle(color: Colors.grey[600], fontSize: 12);
      case TPETextVariant.text12bold:
        return const TextStyle(fontWeight: FontWeight.bold, fontSize: 12);
      case TPETextVariant.text16Bold:
        return const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
      case TPETextVariant.text14SemiBold600:
        return const TextStyle(
          fontWeight: FontWeight.w600,
          color: TPEColors.blue80,
          fontSize: 14,
        );
      case TPETextVariant.text14SemiBold700:
        return const TextStyle(fontWeight: FontWeight.w700, fontSize: 14);
      case TPETextVariant.text16SemiBold600:
        return const TextStyle(fontWeight: FontWeight.w600, fontSize: 16);
      case TPETextVariant.text20SemiBold700:
        return const TextStyle(fontWeight: FontWeight.w700, fontSize: 20);
      default:
        return const TextStyle(fontSize: 14);
    }
  }
}
