import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_typography.dart';

class SecurityDetailCard extends StatelessWidget {
  const SecurityDetailCard({
    super.key,
    this.updateTime = '14:32 - 24/10/2026',
    this.verificationMethod = 'Mã OTP SMS',
    this.oldSessionsStatus = 'Đã đăng xuất toàn bộ',
  });

  final String updateTime;
  final String verificationMethod;
  final String oldSessionsStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadius.cardRadius,
        border: Border.all(color: AppColors.grey200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.shield_outlined,
                size: 20,
                color: Color(0xFF0F3E99),
              ),
              const SizedBox(width: 8),
              Text(
                'Chi tiết cập nhật bảo mật',
                style: AppTypography.mediumSemiBold.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(height: 1, color: AppColors.grey200),
          const SizedBox(height: 14),
          _buildRow(label: 'Thời gian cập nhật', value: updateTime),
          const SizedBox(height: 12),
          _buildRow(label: 'Phương thức xác minh', value: verificationMethod),
          const SizedBox(height: 12),
          _buildRow(label: 'Phiên đăng nhập cũ', value: oldSessionsStatus),
        ],
      ),
    );
  }

  Widget _buildRow({required String label, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: AppTypography.mediumRegular.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: AppTypography.mediumSemiBold.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
