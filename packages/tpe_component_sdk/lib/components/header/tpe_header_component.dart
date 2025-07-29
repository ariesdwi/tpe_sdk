import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEHeaderComponent extends StatelessWidget {
  final String userName;
  final String greeting;
  final int? notificationCount;
  final bool singleLineType;
  final TPECircleIconButton? rightCircleButton;
  final String? logoUrl; 

  const TPEHeaderComponent({
    super.key,
    required this.userName,
    this.greeting = "Welcome",
    this.singleLineType = true,
    this.notificationCount,
    this.rightCircleButton,
    this.logoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          logoUrl != null
              ? Image.network(
                  logoUrl!,
                  width: 48,
                  height: 48,
                )
              : Image.asset(
                  'packages/tpe_homepage_sdk/assets/images/LogoBRImoTimles.png',
                  width: 48,
                  height: 48,
                ),
          const SizedBox(width: 8),
          Expanded(
            child: singleLineType
                ? Text(
                    '$greeting $userName',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TPEText(
                        text: greeting,
                        variant: TPETextVariant.secondary,
                        color: TPEColors.white,
                      ),
                      TPEText(
                        text: userName,
                        variant: TPETextVariant.text14SemiBold700,
                        color: TPEColors.white,
                      ),
                    ],
                  ),
          ),
          if (rightCircleButton != null) rightCircleButton!,
        ],
      ),
    );
  }
}
