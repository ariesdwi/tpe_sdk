import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEHomeMenuTransactionTL extends StatelessWidget {
  final List<TPEHorizontalMenuItem> items;

  const TPEHomeMenuTransactionTL({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 0,
      runSpacing: 0,
      children: items,
    );
  }
}

