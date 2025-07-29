import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/components/icon/tpe_icon_base.dart';

class TPEHomeMenuItemVertical extends StatelessWidget {
  final String title;
  final String iconUrl;
  final double iconSize;
  final bool isNew;
  final VoidCallback? onTap;

  const TPEHomeMenuItemVertical({
    super.key,
    required this.title,
    required this.iconUrl,
    this.isNew = false,
    this.iconSize = 48,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6F3FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TPEBaseIconUrl(iconUrl: iconUrl, size: iconSize),
                ),
                if (isNew)
                  Positioned(
                    top: -8,
                    left: -8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'BARU',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 72,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
