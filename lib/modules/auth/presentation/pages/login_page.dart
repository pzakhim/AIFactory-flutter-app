import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../commons/badge/security_badge.dart';
import '../../../../commons/button/app_primary_button.dart';
import '../../../../commons/button/app_secondary_button.dart';
import '../../../../commons/input/app_text_field.dart';
import '../../../../commons/selection/app_checkbox.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_typography.dart';
import '../cubits/login_cubit.dart';
import '../cubits/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.isSuccess) {
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          }
        },
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();

          return Scaffold(
            backgroundColor: const Color(0xFFF7F9FC),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    // Header Logo & Brand Name
                    Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: AppColors.primary50,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.primary100),
                          ),
                          child: const Icon(
                            Icons.shield_outlined,
                            color: AppColors.primary500,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'DIGIBANK',
                              style: AppTypography.h4.copyWith(
                                color: const Color(0xFF0F3E99),
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.5,
                              ),
                            ),
                            Text(
                              'NGÂN HÀNG SỐ AN TOÀN',
                              style: AppTypography.tinySemiBold.copyWith(
                                color: AppColors.grey500,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),

                    // Screen Title & Subtitle
                    Text(
                      'Đăng nhập',
                      style: AppTypography.h2.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Vui lòng nhập thông tin xác thực để truy cập tài khoản',
                      style: AppTypography.mediumRegular.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Main Form Card
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceWhite,
                        borderRadius: AppRadius.cardRadius,
                        boxShadow: AppShadows.shadow100,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextField(
                            controller: _usernameController,
                            label: 'Tên đăng nhập / Mã khách hàng',
                            hintText: 'Nhập mã khách hàng hoặc CCCD',
                            prefixIcon: const Icon(
                              Icons.person_outline_rounded,
                              color: AppColors.iconGrey,
                            ),
                            onChanged: cubit.onUsernameChanged,
                          ),
                          const SizedBox(height: 16),
                          AppTextField(
                            controller: _passwordController,
                            label: 'Mật khẩu',
                            hintText: 'Nhập mật khẩu của bạn',
                            obscureText: true,
                            errorText: state.passwordError,
                            prefixIcon: const Icon(
                              Icons.lock_outline_rounded,
                              color: AppColors.iconGrey,
                            ),
                            onChanged: cubit.onPasswordChanged,
                          ),
                          const SizedBox(height: 14),

                          // Remember Me & Forgot Password Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: AppCheckbox(
                                  value: state.rememberMe,
                                  label: 'Ghi nhớ tên đăng nhập',
                                  onChanged: cubit.onRememberMeChanged,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, AppRoutes.accountVerification);
                                },
                                child: Text(
                                  'Quên mật khẩu?',
                                  style: AppTypography.mediumSemiBold.copyWith(
                                    color: const Color(0xFF0F4CD9),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          // Primary Submit Button
                          AppPrimaryButton(
                            title: 'Đăng nhập',
                            suffixIcon: const Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                            isLoading: state.isLoading,
                            onPressed: cubit.login,
                          ),
                          const SizedBox(height: 12),

                          // Face ID Button
                          AppSecondaryButton(
                            title: 'Đăng nhập bằng Face ID',
                            prefixIcon: const Icon(
                              Icons.filter_center_focus_rounded,
                              color: AppColors.primary500,
                              size: 20,
                            ),
                            onPressed: cubit.loginWithBiometrics,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),

                    // Security Footer & Hotline Support
                    Center(
                      child: Column(
                        children: [
                          const SecurityBadge(
                            label: 'Bảo mật mã hóa 256-bit SSL & PCI DSS',
                            status: SecurityBadgeStatus.verified,
                          ),
                          const SizedBox(height: 14),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.headset_mic_outlined,
                                size: 16,
                                color: AppColors.textSecondary,
                              ),
                              const SizedBox(width: 6),
                              Flexible(
                                child: Text.rich(
                                  TextSpan(
                                    style: AppTypography.smallRegular.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                    children: [
                                      const TextSpan(text: 'Cần hỗ trợ đăng nhập? Hotline 24/7: '),
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
                            ],
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
