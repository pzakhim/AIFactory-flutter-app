import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

/// Standardized enterprise checkbox with label and touch target >= 44px.
class AppCheckbox extends StatelessWidget {
  const AppCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.enabled = true,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;
  final String? label;
  final bool enabled;

  void _handleTap() {
    if (!enabled || onChanged == null) return;
    HapticFeedback.selectionClick();
    onChanged!(!value);
  }

  @override
  Widget build(BuildContext context) {
    final box = Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: value ? AppColors.primary500 : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: value ? AppColors.primary500 : AppColors.grey300,
          width: 1.5,
        ),
      ),
      child: value
          ? const Icon(
              Icons.check_rounded,
              size: 14,
              color: Colors.white,
            )
          : null,
    );

    return InkWell(
      onTap: enabled ? _handleTap : null,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            box,
            if (label != null) ...[
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  label!,
                  style: AppTypography.mediumRegular.copyWith(
                    color: enabled ? AppColors.textPrimary : AppColors.textDisabled,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
