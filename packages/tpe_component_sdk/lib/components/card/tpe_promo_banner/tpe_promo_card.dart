import 'package:flutter/material.dart';

class TPEPromoCard extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;

  const TPEPromoCard({
    super.key,
    required this.imageUrl,
    this.width = 280,
    this.height = 160,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.grey, 
        ),
        child: imageUrl.startsWith('https')
            ? Image.network(
                imageUrl,
                width: width,
                height: height,
                fit: BoxFit.cover,
              )
            : Image.asset(
                'assets/images/placeholder.png',
                width: width,
                height: height,
                fit: BoxFit.cover,
                package: 'tpe_component_sdk',
              ),
      ),
    );
  }
}
