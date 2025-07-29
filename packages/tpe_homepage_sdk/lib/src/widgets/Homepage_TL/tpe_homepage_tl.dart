import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/components/menu/tpe_section_menu_horizontal.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEHomePageTL extends StatelessWidget {
  final TPEHeaderComponent? header;
  final TPEBalanceCardTL? balanceCard;
  final TPEMenuHorizontalSection? menuSection;
  final String? backgroundUrl;

  const TPEHomePageTL({
    super.key,
    this.header,
    this.balanceCard,
    this.menuSection,
    this.backgroundUrl,
  });

  @override
  Widget build(BuildContext context) {
    const double headerHeight = 72;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double headerOffset = headerHeight + statusBarHeight;

    return Scaffold(
      body: Stack(
        children: [
          // 🖼 Background image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: backgroundUrl != null
                ? Image.network(
                    backgroundUrl!,
                    fit: BoxFit.cover,
                    height: 320,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'packages/tpe_homepage_sdk/assets/images/Group39196.png',
                        fit: BoxFit.cover,
                        height: 320,
                      );
                    },
                  )
                : Image.asset(
                    'packages/tpe_homepage_sdk/assets/images/Group39196.png',
                    fit: BoxFit.cover,
                    height: 320,
                  ),
          ),

          // 📜 Scrollable content below fixed header
          Positioned.fill(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(height: headerOffset + 16),
                if (balanceCard != null) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: balanceCard!,
                  ),
                  const SizedBox(height: 16),
                ],
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: menuSection != null
                      ? menuSection!
                      : const SizedBox(height: 16),
                ),
              ],
            ),
          ),

          // 📌 Fixed header
          if (header != null)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                bottom: false,
                child: SizedBox(child: Center(child: header!)),
              ),
            ),
        ],
      ),
    );
  }
}
