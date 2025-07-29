
import 'package:flutter/material.dart';

class TPECountBadgeIcon extends StatelessWidget {
  final int badgeCount;
  final double badgeSize;
  final Color badgeColor;
  final Color badgeTextColor;

  const TPECountBadgeIcon({
    super.key,
    this.badgeCount = 0,
    this.badgeSize = 16,
    this.badgeColor = Colors.red,
    this.badgeTextColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    if (badgeCount == 0 || badgeCount <= 0) {
      return const SizedBox.shrink(); 
    }

    return Container(
      width: badgeSize,
      height: badgeSize,
      decoration: BoxDecoration(
        color: badgeColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).scaffoldBackgroundColor,
          width: 1.5,
        ),
      ),
      child: Center(
        child: Text(
          badgeCount.toString(),
          style: TextStyle(
            color: badgeTextColor,
            fontSize: badgeSize * 0.6,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
