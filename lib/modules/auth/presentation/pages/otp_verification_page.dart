import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../commons/button/app_primary_button.dart';
import '../../../../commons/feedback/notice_banner_box.dart';
import '../../../../commons/input/otp_input_group.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_typography.dart';
import '../cubits/otp_verification_cubit.dart';
import '../cubits/otp_verification_state.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({
    super.key,
    this.maskedPhone = '098***1234',
  });

  final String maskedPhone;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OtpVerificationCubit(),
      child: BlocConsumer<OtpVerificationCubit, OtpVerificationState>(
        listenWhen: (previous, current) => !previous.isSuccess && current.isSuccess,
        listener: (context, state) {
          if (state.isSuccess) {
            Navigator.pushNamed(context, AppRoutes.newPassword);
          }
        },
        builder: (context, state) {
          final cubit = context.read<OtpVerificationCubit>();

          return Scaffold(
            backgroundColor: const Color(0xFFF7F9FC),
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.surfaceWhite,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.grey300),
                    ),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      size: 18,
                      color: AppColors.iconBlack,
                    ),
                  ),
                ),
              ),
              title: Text(
                'Xác minh OTP',
                style: AppTypography.mediumSemiBold.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.grey100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Bước 2/3',
                        style: AppTypography.tinySemiBold.copyWith(
                          color: AppColors.grey600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      'Nhập mã xác thực',
                      style: AppTypography.h2.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Mã xác thực gồm 6 chữ số vừa được gửi qua tin nhắn SMS đến số điện thoại của bạn.',
                      style: AppTypography.mediumRegular.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Phone target info card
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceWhite,
                        borderRadius: AppRadius.cardRadius,
                        border: Border.all(color: AppColors.grey200),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: AppColors.primary50,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.phone_android_rounded,
                              size: 20,
                              color: AppColors.primary500,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Số điện thoại nhận mã',
                                  style: AppTypography.tinyRegular.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  maskedPhone,
                                  style: AppTypography.mediumSemiBold.copyWith(
                                    color: AppColors.textPrimary,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.primary50,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'SMS OTP',
                              style: AppTypography.tinySemiBold.copyWith(
                                color: AppColors.primary500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),

                    // 6 discrete OTP boxes
                    OtpInputGroup(
                      length: 6,
                      hasError: state.errorMessage != null,
                      onChanged: cubit.onOtpChanged,
                      onCompleted: (_) => cubit.submitOtp(),
                    ),
                    if (state.errorMessage != null) ...[
                      const SizedBox(height: 10),
                      Text(
                        state.errorMessage!,
                        style: AppTypography.smallRegular.copyWith(
                          color: AppColors.error,
                        ),
                      ),
                    ],
                    const SizedBox(height: 24),

                    // Countdown Timer & Resend action
                    Center(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.access_time_rounded,
                                size: 16,
                                color: Color(0xFFDD6B20),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Mã có hiệu lực trong: ',
                                style: AppTypography.smallRegular.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              Text(
                                state.formattedTime,
                                style: AppTypography.smallSemiBold.copyWith(
                                  color: const Color(0xFFDD6B20),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Chưa nhận được mã? ',
                                style: AppTypography.smallRegular.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              InkWell(
                                onTap: state.canResend ? cubit.resendOtp : null,
                                child: Text(
                                  'Gửi lại mã',
                                  style: AppTypography.smallSemiBold.copyWith(
                                    color: state.canResend
                                        ? const Color(0xFF0F4CD9)
                                        : AppColors.textDisabled,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Primary Button
                    AppPrimaryButton(
                      title: 'Xác nhận OTP',
                      isLoading: state.isLoading,
                      onPressed: cubit.submitOtp,
                    ),
                    const SizedBox(height: 36),

                    // Safety Warning Banner
                    const NoticeBannerBox(
                      title: 'Lưu ý an toàn ngân hàng',
                      message:
                          'Tuyệt đối không chia sẻ mã OTP cho bất kỳ ai, kể cả nhân viên ngân hàng dưới bất kỳ hình thức nào.',
                      type: NoticeBannerType.warning,
                    ),
                    const SizedBox(height: 20),

                    // Hotline Footer
                    Center(
                      child: Text.rich(
                        TextSpan(
                          style: AppTypography.smallRegular.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          children: [
                            const TextSpan(text: 'Cần hỗ trợ xác thực? Liên hệ Hotline: '),
                            TextSpan(
                              text: '1900 6868',
                              style: AppTypography.smallSemiBold.copyWith(
                                color: const Color(0xFF0F3E99),
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
        },
      ),
    );
  }
}
