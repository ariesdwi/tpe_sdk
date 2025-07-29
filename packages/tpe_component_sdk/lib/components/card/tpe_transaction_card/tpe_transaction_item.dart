import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';
import 'package:tpe_component_sdk/utils/spacers.dart';

class TpeTransactionItemTw extends StatelessWidget {
  const TpeTransactionItemTw({
    super.key,
    required this.isLoading,
    required this.activityTitle,
    required this.activityIcon,
    required this.activityStatus,
    required this.activityDate,
    required this.activityAmount,
    required this.activityText,
  });
  final bool isLoading;
  final int activityStatus;
  final String activityTitle;
  final String activityIcon;
  final String activityDate;
  final String activityAmount;
  final String activityText;

  @override
  Widget build(BuildContext context) {
    Map<int, Color> activityColor = {
      1: TPEColors.green10,
      2: TPEColors.red10,
      3: TPEColors.orange10,
    };

    Map<int, String> activityStatusText = {
      1: 'Success',
      2: 'Failed',
      3: 'Pending',
    };

    Map<int, Color> activityStatusColor = {
      1: TPEColors.green80,
      2: TPEColors.red80,
      3: TPEColors.orange80,
    };

    return ListTile(
      leading: Skeletonizer(
        enabled: isLoading,
        child: TPEBaseIconUrl(iconUrl: activityIcon, size: 40),
      ),
      title: Skeletonizer(
        enabled: isLoading,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TPEText(
              text: isLoading ? "0000 0000 0000 0000" : activityTitle,
              variant: TPETextVariant.text14SemiBold600,
              color: TPEColors.black,
            ),
            Skeletonizer(
              enabled: isLoading,
              child: Container(
                width: 68,
                height: 26,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isLoading
                      ? TPEColors.ligth10
                      : activityColor[activityStatus],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TPEText(
                  text: activityStatusText[activityStatus] ?? '',
                  variant: TPETextVariant.text12bold,
                  color: activityStatusColor[activityStatus],
                ),
              ),
            ),
          ],
        ),
      ),
      subtitle: Skeletonizer(
        enabled: isLoading,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            4.height,
            TPEText(
              text: isLoading ? "0000 0000 0000 0000" : activityText,
              variant: TPETextVariant.secondary,
            ),
            4.height,
            TPEText(
              text: isLoading ? "---- ----- ----" : activityAmount,
              variant: TPETextVariant.secondary,
            ),
            8.height,
            TPEText(
              text: isLoading ? "---- ----- ---- -----" : activityDate,
              variant: TPETextVariant.secondary,
            ),
          ],
        ),
      ),
      onTap: () {
        debugPrint('Tapped');
      },
    );
  }
}
