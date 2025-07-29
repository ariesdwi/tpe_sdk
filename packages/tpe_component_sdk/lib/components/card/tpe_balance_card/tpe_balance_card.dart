import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tpe_component_sdk/components/button/tpe_copy_button.dart';
import 'package:tpe_component_sdk/components/button/tpe_eye_toggle_button.dart';
import 'package:tpe_component_sdk/components/button/tpe_navigation_card.dart';
import 'package:tpe_component_sdk/components/card/tpe_base_balance_card/tpe_base_balance_card.dart';
import 'package:tpe_component_sdk/components/icon/tpe_balance_indicator.dart';
import 'package:tpe_component_sdk/foundations/tpe_text_variant.dart';
import 'package:tpe_component_sdk/foundations/color_utils.dart';
import 'package:tpe_component_sdk/utils/number_formater.dart';

enum TPEBalanceCardType { tl, tw }

/// Main balance card component that switches between TL and TW styles
class TPEBalanceCard extends StatelessWidget {
  final TPEBalanceCardType type;
  final String accountNumber;
  final String currency;
  final double currentBalance;
  final bool isLoading;
  final VoidCallback? onSeeAll;

  const TPEBalanceCard({
    super.key,
    required this.type,
    required this.accountNumber,
    required this.currency,
    required this.currentBalance,
    this.isLoading = false,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      TPEBalanceCardType.tl => TPEBalanceCardTL(
        accountNumber: accountNumber,
        currency: currency,
        currentBalance: currentBalance,
        isLoading: isLoading,
      ),
      TPEBalanceCardType.tw => TPEBalanceCardTW(
        accountNumber: accountNumber,
        currency: currency,
        currentBalance: currentBalance,
        isLoading: isLoading,
        onSeeAll: onSeeAll,
      ),
    };
  }
}

/// Taiwan Style Balance Card
class TPEBalanceCardTW extends StatefulWidget {
  final String accountNumber;
  final String currency;
  final double currentBalance;
  final bool isLoading;

  // Customization
  final Color? accountNumberTextColor;
  final Color? currencyTextColor;
  final Color? currentBalanceTextColor;
  final TPEText? titleBalanceText;
  final TPECopyButton? copyButton;
  final TPEEyeToggleButton? eyeToggleButton;
  final Color backgroundColor;
  final String? backgroundImage;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double borderRadius;
  final Divider? divider;
  final TPEBalanceIndicator? balanceIndicator;
  final VoidCallback? onSeeAll;

  const TPEBalanceCardTW({
    super.key,
    required this.accountNumber,
    required this.currency,
    required this.currentBalance,
    this.isLoading = false,
    this.accountNumberTextColor,
    this.currencyTextColor,
    this.currentBalanceTextColor,
    this.eyeToggleButton,
    this.copyButton,
    this.balanceIndicator,
    this.titleBalanceText,
    this.backgroundColor = TPEColors.white,
    this.backgroundImage,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    this.margin = const EdgeInsets.all(16),
    this.divider,
    this.borderRadius = 16,
    this.onSeeAll,
  });

  @override
  State<TPEBalanceCardTW> createState() => _TPEBalanceCardTWState();
}

class _TPEBalanceCardTWState extends State<TPEBalanceCardTW> {
  bool _balanceVisible = false;

  void _toggleBalanceVisibility() {
    setState(() {
      _balanceVisible = !_balanceVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TPEBaseBalanceCard(
      backgroundImage:
          widget.backgroundImage ?? 'assets/images/Taiwan_card_image_2.png',
      backgroundColor: widget.backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: const EdgeInsets.all(16),
      borderRadius: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Account Number
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TPEText(
                text: formatAccountNumber(widget.accountNumber),
                variant: TPETextVariant.text14SemiBold600,
                color: widget.accountNumberTextColor ?? TPEColors.ligth80,
              ),
              if (widget.copyButton != null)
                widget.copyButton!
              else
                TPECopyButton(
                  textToCopy: widget.accountNumber,
                  copyText: 'Salin',
                  successMessage: "Nomor rekening disalin",
                ),
            ],
          ),

          if (widget.divider != null) ...[
            const SizedBox(height: 8),
            widget.divider!,
          ] else
            const Divider(color: TPEColors.ligth20, thickness: 1),

          if (widget.titleBalanceText != null)
            widget.titleBalanceText!
          else
            const TPEText(
              text: "Saldo Rekening Utama",
              variant: TPETextVariant.secondary,
            ),

          const SizedBox(height: 8),

          Row(
            children: [
              TPEText(
                text: widget.currency,
                variant: TPETextVariant.text20SemiBold700,
                color: widget.currencyTextColor ?? TPEColors.blue80,
              ),
              const SizedBox(width: 8),
              if (_balanceVisible)
                TPEText(
                  text: widget.currentBalance.toStringAsFixed(2),
                  variant: TPETextVariant.text20SemiBold700,
                  color: widget.currentBalanceTextColor ?? TPEColors.blue80,
                )
              else
                (widget.balanceIndicator ??
                    TPEBalanceIndicator(color: TPEColors.blue80)),

              const SizedBox(width: 8),
              if (widget.eyeToggleButton != null)
                widget.eyeToggleButton!
              else
                TPEEyeToggleButton(
                  visible: _balanceVisible,
                  onTap: _toggleBalanceVisibility,
                ),
            ],
          ),

          const SizedBox(height: 8),

          if (widget.onSeeAll != null)
            TPENavigationCardButton(
              text: "Lihat semua akun",
              onTap: widget.onSeeAll!,
            ),
        ],
      ),
    );
  }
}

/// Taiwan Style Balance Card
class TPEBalanceCardTL extends StatefulWidget {
  final String accountNumber;
  final String currency;
  final double currentBalance;
  final bool isLoading;

  // Customization
  final Color? accountNumberTextColor;
  final Color? currencyTextColor;
  final Color? currentBalanceTextColor;
  final TPEText titleAccountNumberText;
  final TPEText titleBalanceText;
  final String? urlCopyButton;

  const TPEBalanceCardTL({
    super.key,
    required this.accountNumber,
    required this.currency,
    required this.currentBalance,
    required this.isLoading,
    this.accountNumberTextColor,
    this.currencyTextColor,
    this.currentBalanceTextColor,
    this.titleAccountNumberText = const TPEText(
      text: "Account Number",
      variant: TPETextVariant.secondary,
      color: TPEColors.white,
    ),
    this.titleBalanceText = const TPEText(
      text: "Account Balance",
      variant: TPETextVariant.secondary,
      color: TPEColors.white,
    ),
    this.urlCopyButton,
  });

  @override
  State<TPEBalanceCardTL> createState() => _TPEBalanceCardTLState();
}

class _TPEBalanceCardTLState extends State<TPEBalanceCardTL>
    with SingleTickerProviderStateMixin {
  bool _balanceVisible = false;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleBalanceVisibility() {
    setState(() {
      _balanceVisible = !_balanceVisible;
      if (_balanceVisible) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Account Number Section
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              color: TPEColors.blue100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TPEText(
                  text: widget.titleAccountNumberText.text,
                  variant: TPETextVariant.secondary,
                  color: TPEColors.white,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Skeletonizer(
                      enabled: widget.isLoading,
                      effect: ShimmerEffect(
                        baseColor: TPEColors.blue20,
                        highlightColor: Colors.grey[100]!,
                        duration: const Duration(seconds: 2),
                      ),
                      child: TPEText(
                        text: widget.isLoading
                            ? '000 000 000 000 000'
                            : formatAccountNumber(widget.accountNumber),
                        variant: TPETextVariant.text16SemiBold600,
                        color: TPEColors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    TPECopyButton(
                      textToCopy: widget.accountNumber,
                      copyImage: widget.urlCopyButton,
                      successMessage: 'Salin Nomor Rekening',
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Balance Section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
              color: TPEColors.blue80,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TPEText(
                  text: widget.titleBalanceText.text,
                  variant: TPETextVariant.secondary,
                  color: TPEColors.white,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Skeletonizer(
                      enabled: widget.isLoading,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: _balanceVisible
                            ? FadeTransition(
                                opacity: _fadeAnimation,
                                key: const ValueKey(1),
                                child: TPEText(
                                  text: widget.isLoading
                                      ? '${widget.currency} 000000.00'
                                      : '${widget.currency} ${widget.currentBalance.toStringAsFixed(2)}',
                                  variant: TPETextVariant.text20SemiBold700,
                                  color: TPEColors.white,
                                ),
                              )
                            : const TPEBalanceIndicator(
                                key: ValueKey(2),
                                itemCount: 5,
                                color: TPEColors.white,
                              ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        _balanceVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: TPEColors.white,
                      ),
                      onPressed: _toggleBalanceVisibility,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
