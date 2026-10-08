import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_typography.dart';

/// Medium-emphasis secondary/outline button.
class AppSecondaryButton extends StatelessWidget {
  const AppSecondaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.width = double.infinity,
    this.height = 48.0,
  });

  final String title;
  final VoidCallback? onPressed;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? width;
  final double height;

  void _handlePressed() {
    if (!enabled || onPressed == null) return;
    HapticFeedback.lightImpact();
    onPressed!();
  }

  @override
  Widget build(BuildContext context) {
    final isInteractive = enabled && onPressed != null;

    final button = OutlinedButton(
      onPressed: isInteractive ? _handlePressed : null,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textPrimary,
        backgroundColor: Colors.transparent,
        disabledForegroundColor: AppColors.textDisabled,
        minimumSize: Size(width ?? 0, height),
        side: BorderSide(
          color: isInteractive ? AppColors.grey300 : AppColors.grey200,
          width: 1.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.buttonRadius,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null) ...[
            prefixIcon!,
            const SizedBox(width: 8),
          ],
          Text(
            title,
            style: AppTypography.largeSemiBold.copyWith(
              color: isInteractive ? AppColors.textPrimary : AppColors.textDisabled,
            ),
          ),
          if (suffixIcon != null) ...[
            const SizedBox(width: 8),
            suffixIcon!,
          ],
        ],
      ),
    );

    return Semantics(
      button: true,
      enabled: isInteractive,
      label: title,
      child: width != null ? SizedBox(width: width, child: button) : button,
    );
  }
}
