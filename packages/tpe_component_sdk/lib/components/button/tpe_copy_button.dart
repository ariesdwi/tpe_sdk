import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:tpe_component_sdk/foundations/tpe_text_variant.dart';
import 'package:tpe_component_sdk/utils/top_modal.dart';

class TPECopyButton extends StatelessWidget {
  final String textToCopy;
  final String? copyText;
  final String? copyImage;
  final TextStyle? textStyle;
  final String? successMessage;

  const TPECopyButton({
    super.key,
    required this.textToCopy,
    this.copyText,
    this.copyImage,
    this.textStyle,
    this.successMessage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: textToCopy)).then((_) {
          showTopSnackBar(
            Overlay.of(context),
            TopModal.success(message: successMessage ?? "Salinan berhasil!"),
            displayDuration: Duration(seconds: 3),
          );
        });
      },
      child: Row(
        children: [
          if (copyText != null)
            TPEText(
              text: copyText!,
              styleOverride: textStyle,
              variant: TPETextVariant.text14SemiBold600,
            ),
          SizedBox(width: 8),
          copyImage != null
              ? Image.network(copyImage!, width: 20)
              : SvgPicture.asset(
                  'assets/svg/copy-blue.svg',
                  width: 20,
                  package: 'tpe_component_sdk',
                ),
        ],
      ),
    );
  }
}
