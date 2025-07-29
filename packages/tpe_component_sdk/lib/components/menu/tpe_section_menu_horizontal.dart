import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/components/menu/tpe_component_menu_horizontal.dart';
import 'package:tpe_component_sdk/components/menu/tpe_homepage_menu_transaction_tl.dart';
import 'package:tpe_component_sdk/components/section/tpe_component_section_header.dart';

class TPEMenuHorizontalSection extends StatelessWidget {
  final TpeComponentSectionHeader? sectionHeader;
  final List<TPEHorizontalMenuItem> menuItems;

  const TPEMenuHorizontalSection({
    super.key,
    this.sectionHeader,
    required this.menuItems,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (sectionHeader != null) ...[
          sectionHeader!,
          const SizedBox(height: 16),
        ],
        if (menuItems.isNotEmpty)
          TPEHomeMenuTransactionTL(items: menuItems),
      ],
    );
  }
}
