import 'package:flutter/material.dart';

class TPEBaseIconUrl extends StatelessWidget {
  final String iconUrl;
  final Color color;
  final double size;

  const TPEBaseIconUrl({
    super.key,
    required this.iconUrl,
    this.color = Colors.blue,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return iconUrl.startsWith('https')
        ? Image.network(
            iconUrl,
            width: size,
            height: size,
            fit: BoxFit.cover,
          )
        : Image.asset(
            'assets/images/TRANSFER_NEW.png',
            width: size,
            height: size,
            fit: BoxFit.cover,
            package: 'tpe_component_sdk',
          );
  }
}
