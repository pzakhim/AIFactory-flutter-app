import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:digibank_app/core/routes/app_routes.dart';
import 'package:digibank_app/modules/auth/presentation/pages/account_verification_page.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget createAccountVerificationApp() {
    return MaterialApp(
      initialRoute: AppRoutes.accountVerification,
      routes: {
        AppRoutes.accountVerification: (context) => const AccountVerificationPage(),
        AppRoutes.otpVerification: (context) => const Scaffold(body: Text('OTP Verification Screen')),
      },
    );
  }

  group('AccountVerificationPage Widget Tests', () {
    testWidgets('renders all screen elements correctly', (tester) async {
      await tester.pumpWidget(createAccountVerificationApp());
      await tester.pump();

      expect(find.text('Khôi phục mật khẩu'), findsOneWidget);
      expect(find.text('BẢO MẬT 2 LỚP OTP'), findsOneWidget);
      expect(find.text('Xác thực tài khoản'), findsOneWidget);
      expect(find.text('Số điện thoại hoặc Email đăng ký'), findsOneWidget);
      expect(find.text('0982 888 668'), findsOneWidget);
      expect(find.text('Gửi mã OTP'), findsOneWidget);
      expect(find.text('Nguyên tắc bảo mật'), findsOneWidget);
      expect(find.textContaining('1900 6868'), findsOneWidget);
    });

    testWidgets('navigates to OTP verification screen on successful submission', (tester) async {
      await tester.pumpWidget(createAccountVerificationApp());
      await tester.pump();

      final submitButton = find.widgetWithText(ElevatedButton, 'Gửi mã OTP');
      await tester.tap(submitButton);
      await tester.pumpAndSettle();

      expect(find.text('OTP Verification Screen'), findsOneWidget);
    });
  });
}
