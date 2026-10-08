import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../commons/button/app_primary_button.dart';
import '../../../../commons/feedback/notice_banner_box.dart';
import '../../../../commons/input/app_text_field.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../cubits/account_verification_cubit.dart';
import '../cubits/account_verification_state.dart';

class AccountVerificationPage extends StatefulWidget {
  const AccountVerificationPage({super.key});

  @override
  State<AccountVerificationPage> createState() => _AccountVerificationPageState();
}

class _AccountVerificationPageState extends State<AccountVerificationPage> {
  late final TextEditingController _contactController;

  @override
  void initState() {
    super.initState();
    _contactController = TextEditingController(text: '0982 888 668');
  }

  @override
  void dispose() {
    _contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AccountVerificationCubit()..onContactChanged(_contactController.text),
      child: BlocConsumer<AccountVerificationCubit, AccountVerificationState>(
        listenWhen: (previous, current) => !previous.isSuccess && current.isSuccess,
        listener: (context, state) {
          if (state.isSuccess) {
            Navigator.pushNamed(context, AppRoutes.otpVerification);
          }
        },
        builder: (context, state) {
          final cubit = context.read<AccountVerificationCubit>();

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
                'Khôi phục mật khẩu',
                style: AppTypography.mediumSemiBold.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Shield icon + Badge
                    Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: AppColors.primary50,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.primary100),
                          ),
                          child: const Icon(
                            Icons.shield_outlined,
                            color: AppColors.primary500,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEDF4FE),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'BẢO MẬT 2 LỚP OTP',
                            style: AppTypography.tinySemiBold.copyWith(
                              color: AppColors.primary500,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Title & Description
                    Text(
                      'Xác thực tài khoản',
                      style: AppTypography.h2.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Vui lòng nhập Email hoặc Số điện thoại đã đăng ký dịch vụ Ngân hàng điện tử. Chúng tôi sẽ gửi mã xác thực OTP để xác minh danh tính của bạn.',
                      style: AppTypography.mediumRegular.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Input field
                    AppTextField(
                      controller: _contactController,
                      label: 'Số điện thoại hoặc Email đăng ký',
                      hintText: 'Nhập số điện thoại hoặc email',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(
                        Icons.person_outline_rounded,
                        color: AppColors.iconGrey,
                      ),
                      suffixIcon: state.isValidContact
                          ? const Icon(
                              Icons.verified_user_rounded,
                              color: AppColors.success,
                              size: 20,
                            )
                          : null,
                      errorText: state.errorMessage,
                      onChanged: cubit.onContactChanged,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Hệ thống sẽ tự động đối soát thông tin với cơ sở dữ liệu định danh của ngân hàng.',
                      style: AppTypography.smallRegular.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Primary CTA
                    AppPrimaryButton(
                      title: 'Gửi mã OTP',
                      isLoading: state.isLoading,
                      onPressed: cubit.submit,
                    ),
                    const SizedBox(height: 48),

                    // Security Principle Banner
                    const NoticeBannerBox(
                      title: 'Nguyên tắc bảo mật',
                      message:
                          'Ngân hàng KHÔNG BAO GIỜ yêu cầu bạn cung cấp mã xác thực OTP, mật khẩu hay mã PIN qua điện thoại, tin nhắn hoặc bất kỳ đường link nào.',
                      type: NoticeBannerType.info,
                    ),
                    const SizedBox(height: 24),

                    // Footer Hotline
                    Center(
                      child: Text.rich(
                        TextSpan(
                          style: AppTypography.smallRegular.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          children: [
                            const TextSpan(text: 'Bạn đã đổi số điện thoại hoặc email? '),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.phone_in_talk_outlined,
                                    size: 14,
                                    color: Color(0xFFC05621),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Gọi 1900 6868',
                                    style: AppTypography.smallSemiBold.copyWith(
                                      color: const Color(0xFFC05621),
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
        },
      ),
    );
  }
}
