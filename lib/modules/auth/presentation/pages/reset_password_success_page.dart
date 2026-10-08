import 'package:flutter/material.dart';
import '../../../../commons/button/app_primary_button.dart';
import '../../../../commons/feedback/notice_banner_box.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../widgets/security_detail_card.dart';

class ResetPasswordSuccessPage extends StatelessWidget {
  const ResetPasswordSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),

              // Large Circular Checkmark Badge (84x84)
              Container(
                width: 84,
                height: 84,
                decoration: BoxDecoration(
                  color: AppColors.green50,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.green100, width: 2),
                ),
                child: const Icon(
                  Icons.check_rounded,
                  size: 44,
                  color: AppColors.green500,
                ),
              ),
              const SizedBox(height: 24),

              // Title & Message
              Text(
                'Đổi mật khẩu thành công',
                style: AppTypography.h2.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Mật khẩu tài khoản ngân hàng số của quý khách đã được cập nhật an toàn. Vui lòng sử dụng mật khẩu mới cho các lần đăng nhập tiếp theo.',
                  style: AppTypography.mediumRegular.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 28),

              // Security Detail Card
              const SecurityDetailCard(),
              const SizedBox(height: 20),

              // Safe Advisory Callout
              const NoticeBannerBox(
                title: 'Lưu ý an toàn',
                message:
                    'Để bảo đảm an toàn, hệ thống không tự động đăng nhập. Quý khách vui lòng nhập lại mật khẩu mới để tiếp tục sử dụng.',
                type: NoticeBannerType.info,
              ),
              const SizedBox(height: 36),

              // Back to Login Primary Button
              AppPrimaryButton(
                title: 'Quay lại đăng nhập',
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.login,
                    (route) => false,
                  );
                },
              ),
              const SizedBox(height: 20),

              // Hotline Help Footer
              Center(
                child: Text.rich(
                  TextSpan(
                    style: AppTypography.smallRegular.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    children: [
                      const TextSpan(text: 'Không phải bạn thực hiện? '),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.phone_in_talk_outlined,
                              size: 14,
                              color: Color(0xFF0F3E99),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Gọi Hotline 1900 6868',
                              style: AppTypography.smallSemiBold.copyWith(
                                color: const Color(0xFF0F3E99),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
