import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/components/menu/tpe_component_menu_vertical.dart';

class TPEMenuListVertical extends StatelessWidget {
  final List<TPEHomeMenuItemVertical> menuItems;
  final bool show;
  final double? spacing;

  const TPEMenuListVertical({
    super.key,
    required this.menuItems,
    this.show = true,
    this.spacing = 16,
  });

  @override
  Widget build(BuildContext context) {
    if (!show) return const SizedBox.shrink();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: menuItems.map((item) {
          return Padding(
            padding: EdgeInsets.only(right: spacing!),
            child: TPEHomeMenuItemVertical(
              title: item.title,
              iconUrl: item.iconUrl,
              isNew: item.isNew,
              onTap: item.onTap,
            ),
          );
        }).toList(),
      ),
    );
  }
}
