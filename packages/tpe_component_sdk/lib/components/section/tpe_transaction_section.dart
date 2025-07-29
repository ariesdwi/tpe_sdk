import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/components/card/tpe_transaction_card/tpe_transaction_list.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TpeTransactionSection extends StatelessWidget {
  final TpeComponentSectionHeader? sectionHeader;
  final List<TpeTransactionItemTw>? listTransaction;

  const TpeTransactionSection({
    super.key,
    this.sectionHeader,
    this.listTransaction,
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
        if (listTransaction != null && listTransaction!.isNotEmpty)
          TPETransactionList(listTransaction: listTransaction!)
        else
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Tidak ada transaksi',
              style: TextStyle(color: Colors.grey),
            ),
          ),
      ],
    );
  }
}