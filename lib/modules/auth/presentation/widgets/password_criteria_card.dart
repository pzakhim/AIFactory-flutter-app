import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_typography.dart';

class PasswordCriteriaCard extends StatelessWidget {
  const PasswordCriteriaCard({
    super.key,
    required this.hasLength,
    required this.hasUpperLower,
    required this.hasDigit,
    required this.hasSpecialChar,
  });

  final bool hasLength;
  final bool hasUpperLower;
  final bool hasDigit;
  final bool hasSpecialChar;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadius.cardRadius,
        border: Border.all(color: AppColors.grey200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tiêu chuẩn mật khẩu ngân hàng',
            style: AppTypography.mediumSemiBold.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          _buildCriteriaItem(
            isValid: hasLength,
            label: 'Từ 8 đến 20 ký tự',
          ),
          const SizedBox(height: 8),
          _buildCriteriaItem(
            isValid: hasUpperLower,
            label: 'Bao gồm cả chữ in hoa và in thường (A-z)',
          ),
          const SizedBox(height: 8),
          _buildCriteriaItem(
            isValid: hasDigit,
            label: 'Có ít nhất 1 chữ số (0-9)',
          ),
          const SizedBox(height: 8),
          _buildCriteriaItem(
            isValid: hasSpecialChar,
            label: 'Có ít nhất 1 ký tự đặc biệt (!@#\$%^&*)',
          ),
        ],
      ),
    );
  }

  Widget _buildCriteriaItem({
    required bool isValid,
    required String label,
  }) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
          size: 18,
          color: isValid ? AppColors.success : AppColors.iconGrey,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: AppTypography.smallRegular.copyWith(
              color: isValid ? AppColors.textPrimary : AppColors.textSecondary,
              fontWeight: isValid ? FontWeight.w500 : FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
