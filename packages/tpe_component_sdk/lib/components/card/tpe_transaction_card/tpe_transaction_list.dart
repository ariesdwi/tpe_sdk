import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/components/card/tpe_transaction_card/tpe_transaction_item.dart';
import 'package:tpe_component_sdk/foundations/color_utils.dart';

class TPETransactionList extends StatelessWidget {
  final List<TpeTransactionItemTw>? listTransaction;

  const TPETransactionList({
    super.key,
    required this.listTransaction,
  });

  @override
  Widget build(BuildContext context) {
    if (listTransaction == null || listTransaction!.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          'No transactions available',
          style: TextStyle(
            color: TPEColors.blue60,
            fontSize: 14,
          ),
        ),
      );
    }

    return Column(
      children: List.generate(listTransaction!.length * 2 - 1, (index) {
        if (index.isOdd) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Colors.grey,
              indent: 16,
              endIndent: 16,
            ),
          );
        }

        final item = listTransaction![index ~/ 2];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: item,
        );
      }),
    );
  }
}
