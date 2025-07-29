import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEBalanceIndicator extends StatelessWidget {
  final int itemCount;
  final double size;
  final double spacing;
  final Color color;

  const TPEBalanceIndicator({
    super.key,
    this.itemCount = 5,
    this.size = 12,
    this.spacing = 8,
    this.color = TPEColors.blue80,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        itemCount,
        (index) => Container(
          width: size,
          height: size,
          margin: EdgeInsets.only(right: index == itemCount - 1 ? 0 : spacing),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(size / 2),
          ),
        ),
      ),
    );
  }
}
