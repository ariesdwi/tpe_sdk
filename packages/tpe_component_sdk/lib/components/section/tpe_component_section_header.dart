import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/components/icon/tpe_icon_base.dart';

class TpeComponentSectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final TPEBaseIconUrl? leadingIcon;
  final Widget? trailingIcon;
  final VoidCallback? onTap;

  const TpeComponentSectionHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.leadingIcon,
    this.trailingIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              if (leadingIcon != null) ...[
                InkWell(
                  onTap: onTap,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFE3F2FD),
                        ),
                        child: leadingIcon!,
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
                ),
                const SizedBox.shrink(),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              trailingIcon != null
                  ? InkWell(
                      onTap: onTap,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFE3F2FD),
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
