import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../commons/button/app_primary_button.dart';
import '../../../../commons/input/app_text_field.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../cubits/new_password_cubit.dart';
import '../cubits/new_password_state.dart';
import '../widgets/password_criteria_card.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  late final TextEditingController _newPasswordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewPasswordCubit(),
      child: BlocConsumer<NewPasswordCubit, NewPasswordState>(
        listenWhen: (previous, current) => !previous.isSuccess && current.isSuccess,
        listener: (context, state) {
          if (state.isSuccess) {
            Navigator.pushReplacementNamed(context, AppRoutes.resetSuccess);
          }
        },
        builder: (context, state) {
          final cubit = context.read<NewPasswordCubit>();

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
                'Đặt mật khẩu mới',
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
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceWhite,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.grey300),
                      ),
                      child: const Icon(
                        Icons.help_outline_rounded,
                        size: 18,
                        color: AppColors.iconGrey,
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
                    // Step Badge
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEDF4FE),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.key_rounded,
                            size: 14,
                            color: AppColors.primary500,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'BƯỚC 3 / 3 • BẢO MẬT',
                            style: AppTypography.tinySemiBold.copyWith(
                              color: AppColors.primary500,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Heading & Subtitle
                    Text(
                      'Thiết lập mật khẩu an toàn',
                      style: AppTypography.h2.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Mật khẩu mới cần đáp ứng tiêu chuẩn an ninh ngân hàng để bảo vệ tài khoản của bạn.',
                      style: AppTypography.mediumRegular.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // New Password Field
                    AppTextField(
                      controller: _newPasswordController,
                      label: 'Mật khẩu mới',
                      hintText: 'Nhập mật khẩu mới',
                      obscureText: true,
                      prefixIcon: const Icon(
                        Icons.lock_outline_rounded,
                        color: AppColors.iconGrey,
                      ),
                      onChanged: cubit.onNewPasswordChanged,
                    ),
                    const SizedBox(height: 16),

                    // Real-time Criteria Card
                    PasswordCriteriaCard(
                      hasLength: state.hasLength,
                      hasUpperLower: state.hasUpperAndLower,
                      hasDigit: state.hasDigit,
                      hasSpecialChar: state.hasSpecialChar,
                    ),
                    const SizedBox(height: 16),

                    // Confirm Password Field
                    AppTextField(
                      controller: _confirmPasswordController,
                      label: 'Nhập lại mật khẩu mới',
                      hintText: 'Xác nhận mật khẩu mới',
                      obscureText: true,
                      errorText: state.errorMessage,
                      prefixIcon: const Icon(
                        Icons.lock_outline_rounded,
                        color: AppColors.iconGrey,
                      ),
                      onChanged: cubit.onConfirmPasswordChanged,
                    ),
                    const SizedBox(height: 28),

                    // Primary Button
                    AppPrimaryButton(
                      title: 'Cập nhật mật khẩu',
                      enabled: state.isAllValid,
                      isLoading: state.isLoading,
                      onPressed: cubit.updatePassword,
                    ),
                    const SizedBox(height: 36),

                    // Security compliance note
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.shield_outlined,
                            size: 16,
                            color: Color(0xFF0F8DF7),
                          ),
                          const SizedBox(width: 6),
                          Flexible(
                            child: Text(
                              'Mật khẩu được mã hóa chuẩn an ninh thanh toán quốc tế PCI DSS',
                              style: AppTypography.tinyRegular.copyWith(
                                color: AppColors.textSecondary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
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
