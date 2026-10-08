import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:digibank_app/core/routes/app_routes.dart';
import 'package:digibank_app/modules/auth/presentation/pages/reset_password_success_page.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget createResetSuccessApp() {
    return MaterialApp(
      initialRoute: AppRoutes.resetSuccess,
      routes: {
        AppRoutes.resetSuccess: (context) => const ResetPasswordSuccessPage(),
        AppRoutes.login: (context) => const Scaffold(body: Text('Login Screen Reset')),
      },
    );
  }

  group('ResetPasswordSuccessPage Widget Tests', () {
    testWidgets('renders success checkmark, detail card, notice and button', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(createResetSuccessApp());
      await tester.pump();

      expect(find.byIcon(Icons.check_rounded), findsOneWidget);
      expect(find.text('Đổi mật khẩu thành công'), findsOneWidget);
      expect(find.text('Chi tiết cập nhật bảo mật'), findsOneWidget);
      expect(find.text('Thời gian cập nhật'), findsOneWidget);
      expect(find.text('Phương thức xác minh'), findsOneWidget);
      expect(find.text('Phiên đăng nhập cũ'), findsOneWidget);
      expect(find.text('Lưu ý an toàn'), findsOneWidget);
      expect(find.text('Quay lại đăng nhập'), findsOneWidget);
      expect(find.textContaining('1900 6868'), findsOneWidget);
    });

    testWidgets('navigates back to login resetting navigation stack', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(createResetSuccessApp());
      await tester.pump();

      await tester.ensureVisible(find.widgetWithText(ElevatedButton, 'Quay lại đăng nhập'));
      await tester.tap(find.widgetWithText(ElevatedButton, 'Quay lại đăng nhập'));
      await tester.pumpAndSettle();

      expect(find.text('Login Screen Reset'), findsOneWidget);
    });
  });
}
