import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_typography.dart';

enum NoticeBannerType {
  info,
  warning,
  success,
  error,
}

/// Standardized banking advisory notice/alert banner box.
class NoticeBannerBox extends StatelessWidget {
  const NoticeBannerBox({
    super.key,
    required this.title,
    required this.message,
    this.type = NoticeBannerType.info,
    this.icon,
  });

  final String title;
  final String message;
  final NoticeBannerType type;
  final IconData? icon;

  Color get _accentColor {
    switch (type) {
      case NoticeBannerType.info:
        return AppColors.info;
      case NoticeBannerType.warning:
        return AppColors.warning;
      case NoticeBannerType.success:
        return AppColors.success;
      case NoticeBannerType.error:
        return AppColors.error;
    }
  }

  Color get _backgroundColor {
    switch (type) {
      case NoticeBannerType.info:
        return const Color(0xFFF3F7FA);
      case NoticeBannerType.warning:
        return const Color(0xFFFFF9ED);
      case NoticeBannerType.success:
        return AppColors.green50;
      case NoticeBannerType.error:
        return AppColors.red50;
    }
  }

  Color get _borderColor {
    switch (type) {
      case NoticeBannerType.info:
        return const Color(0xFFE2ECF3);
      case NoticeBannerType.warning:
        return const Color(0xFFFFECC8);
      case NoticeBannerType.success:
        return AppColors.green100;
      case NoticeBannerType.error:
        return AppColors.red100;
    }
  }

  IconData get _defaultIcon {
    if (icon != null) return icon!;
    switch (type) {
      case NoticeBannerType.info:
        return Icons.info_outline_rounded;
      case NoticeBannerType.warning:
        return Icons.shield_outlined;
      case NoticeBannerType.success:
        return Icons.check_circle_outline_rounded;
      case NoticeBannerType.error:
        return Icons.error_outline_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: AppRadius.cardRadius,
        border: Border.all(color: _borderColor, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            _defaultIcon,
            size: 20,
            color: _accentColor,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: AppTypography.mediumSemiBold.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: AppTypography.smallRegular.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
