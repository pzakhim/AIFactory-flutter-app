import 'package:flutter/material.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'modules/auth/presentation/pages/account_verification_page.dart';
import 'modules/auth/presentation/pages/login_page.dart';
import 'modules/auth/presentation/pages/new_password_page.dart';
import 'modules/auth/presentation/pages/otp_verification_page.dart';
import 'modules/auth/presentation/pages/reset_password_success_page.dart';
import 'modules/home/presentation/pages/home_page.dart';

class DigiBankApp extends StatelessWidget {
  const DigiBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DigiBank',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (context) => const LoginPage(),
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.accountVerification: (context) => const AccountVerificationPage(),
        AppRoutes.otpVerification: (context) => const OtpVerificationPage(),
        AppRoutes.newPassword: (context) => const NewPasswordPage(),
        AppRoutes.resetSuccess: (context) => const ResetPasswordSuccessPage(),
      },
    );
  }
}
