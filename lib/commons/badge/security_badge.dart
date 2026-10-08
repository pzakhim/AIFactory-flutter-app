import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

enum SecurityBadgeStatus {
  verified,
  encrypted,
  warning,
  info,
}

/// Standardized security trust badge for high-trust banking screens.
class SecurityBadge extends StatelessWidget {
  const SecurityBadge({
    super.key,
    required this.label,
    this.status = SecurityBadgeStatus.verified,
    this.icon,
    this.compact = false,
  });

  final String label;
  final SecurityBadgeStatus status;
  final IconData? icon;
  final bool compact;

  Color get _primaryColor {
    switch (status) {
      case SecurityBadgeStatus.verified:
        return AppColors.green600;
      case SecurityBadgeStatus.encrypted:
        return AppColors.primary500;
      case SecurityBadgeStatus.warning:
        return AppColors.warning;
      case SecurityBadgeStatus.info:
        return AppColors.info;
    }
  }

  Color get _backgroundColor {
    switch (status) {
      case SecurityBadgeStatus.verified:
        return AppColors.green50;
      case SecurityBadgeStatus.encrypted:
        return AppColors.primary50;
      case SecurityBadgeStatus.warning:
        return AppColors.warningBg;
      case SecurityBadgeStatus.info:
        return AppColors.infoBg;
    }
  }

  Color get _borderColor {
    switch (status) {
      case SecurityBadgeStatus.verified:
        return AppColors.green100;
      case SecurityBadgeStatus.encrypted:
        return AppColors.primary100;
      case SecurityBadgeStatus.warning:
        return AppColors.yellow100;
      case SecurityBadgeStatus.info:
        return AppColors.blue100;
    }
  }

  IconData get _effectiveIcon {
    if (icon != null) return icon!;
    switch (status) {
      case SecurityBadgeStatus.verified:
        return Icons.lock_outline_rounded;
      case SecurityBadgeStatus.encrypted:
        return Icons.verified_user_rounded;
      case SecurityBadgeStatus.warning:
        return Icons.shield_outlined;
      case SecurityBadgeStatus.info:
        return Icons.info_outline_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 8 : 12,
        vertical: compact ? 4 : 6,
      ),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _borderColor, width: 1.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _effectiveIcon,
            size: compact ? 14 : 16,
            color: _primaryColor,
          ),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              label,
              style: AppTypography.smallSemiBold.copyWith(
                color: _primaryColor,
                fontSize: compact ? 11 : 12,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
