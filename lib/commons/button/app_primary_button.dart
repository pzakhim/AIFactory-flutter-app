import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_typography.dart';

/// High-emphasis brand primary button with loading indicator, prefix/suffix icons,
/// and disabled states according to Design System.
class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.width = double.infinity,
    this.height = 48.0,
  });

  final String title;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? width;
  final double height;

  void _handlePressed() {
    if (!enabled || isLoading || onPressed == null) return;
    HapticFeedback.lightImpact();
    onPressed!();
  }

  @override
  Widget build(BuildContext context) {
    final isInteractive = enabled && !isLoading && onPressed != null;

    final content = AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: isLoading
          ? const SizedBox(
              key: ValueKey('button_loading'),
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Row(
              key: const ValueKey('button_content'),
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
                    color: isInteractive ? AppColors.textWhite : AppColors.textDisabled,
                  ),
                ),
                if (suffixIcon != null) ...[
                  const SizedBox(width: 8),
                  suffixIcon!,
                ],
              ],
            ),
    );

    final button = ElevatedButton(
      onPressed: isInteractive ? _handlePressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary500,
        disabledBackgroundColor: AppColors.grey200,
        disabledForegroundColor: AppColors.textDisabled,
        foregroundColor: AppColors.textWhite,
        minimumSize: Size(width ?? 0, height),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.buttonRadius,
        ),
        elevation: 0,
      ),
      child: content,
    );

    return Semantics(
      button: true,
      enabled: isInteractive,
      label: title,
      child: width != null ? SizedBox(width: width, child: button) : button,
    );
  }
}
