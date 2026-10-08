import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:digibank_app/core/routes/app_routes.dart';
import 'package:digibank_app/modules/auth/presentation/pages/otp_verification_page.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget createOtpVerificationApp() {
    return MaterialApp(
      initialRoute: AppRoutes.otpVerification,
      routes: {
        AppRoutes.otpVerification: (context) => const OtpVerificationPage(),
        AppRoutes.newPassword: (context) => const Scaffold(body: Text('New Password Screen')),
      },
    );
  }

  group('OtpVerificationPage Widget Tests', () {
    testWidgets('renders all screen elements and OTP boxes correctly', (tester) async {
      await tester.pumpWidget(createOtpVerificationApp());
      await tester.pump();

      expect(find.text('Xác minh OTP'), findsOneWidget);
      expect(find.text('Bước 2/3'), findsOneWidget);
      expect(find.text('Nhập mã xác thực'), findsOneWidget);
      expect(find.text('098***1234'), findsOneWidget);
      expect(find.text('SMS OTP'), findsOneWidget);
      expect(find.textContaining('Mã có hiệu lực trong:'), findsOneWidget);
      expect(find.text('Gửi lại mã'), findsOneWidget);
      expect(find.text('Xác nhận OTP'), findsOneWidget);
      expect(find.text('Lưu ý an toàn ngân hàng'), findsOneWidget);
      expect(find.textContaining('1900 6868'), findsOneWidget);

      // Verify 6 OTP boxes
      expect(find.byType(TextField), findsNWidgets(6));
    });

    testWidgets('shows error when submitting incomplete OTP', (tester) async {
      await tester.pumpWidget(createOtpVerificationApp());
      await tester.pump();

      final confirmButton = find.widgetWithText(ElevatedButton, 'Xác nhận OTP');
      await tester.tap(confirmButton);
      await tester.pump();

      expect(find.text('Vui lòng nhập đủ 6 chữ số mã OTP'), findsOneWidget);
    });

    testWidgets('navigates to New Password screen when 6-digit OTP is entered and submitted', (tester) async {
      await tester.pumpWidget(createOtpVerificationApp());
      await tester.pump();

      final textFields = find.byType(TextField);
      for (int i = 0; i < 6; i++) {
        await tester.enterText(textFields.at(i), '${i + 1}');
      }
      await tester.pump();

      final confirmButton = find.widgetWithText(ElevatedButton, 'Xác nhận OTP');
      await tester.tap(confirmButton);
      await tester.pumpAndSettle();

      expect(find.text('New Password Screen'), findsOneWidget);
    });
  });
}
