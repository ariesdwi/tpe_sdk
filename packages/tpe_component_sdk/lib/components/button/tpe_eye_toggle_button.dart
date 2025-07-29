import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';


class TPEEyeToggleButton extends StatelessWidget {
  final bool visible;
  final Color color;
  final VoidCallback onTap;

  const TPEEyeToggleButton({
    super.key,
    required this.visible,
    required this.onTap,
    this.color = TPEColors.blue80,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        visible ? Icons.visibility_off : Icons.visibility,
        color: color,
        size: 24,
      ),
    );
  }
}
