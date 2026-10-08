import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:digibank_app/core/routes/app_routes.dart';
import 'package:digibank_app/modules/auth/presentation/pages/new_password_page.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget createNewPasswordApp() {
    return MaterialApp(
      initialRoute: AppRoutes.newPassword,
      routes: {
        AppRoutes.newPassword: (context) => const NewPasswordPage(),
        AppRoutes.resetSuccess: (context) => const Scaffold(body: Text('Reset Success Screen')),
      },
    );
  }

  group('NewPasswordPage Widget Tests', () {
    testWidgets('renders all screen elements and criteria checklist', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(createNewPasswordApp());
      await tester.pump();

      expect(find.text('Đặt mật khẩu mới'), findsOneWidget);
      expect(find.text('BƯỚC 3 / 3 • BẢO MẬT'), findsOneWidget);
      expect(find.text('Thiết lập mật khẩu an toàn'), findsOneWidget);
      expect(find.text('Mật khẩu mới'), findsOneWidget);
      expect(find.text('Nhập lại mật khẩu mới'), findsOneWidget);
      expect(find.text('Tiêu chuẩn mật khẩu ngân hàng'), findsOneWidget);
      expect(find.text('Từ 8 đến 20 ký tự'), findsOneWidget);
      expect(find.text('Bao gồm cả chữ in hoa và in thường (A-z)'), findsOneWidget);
      expect(find.text('Có ít nhất 1 chữ số (0-9)'), findsOneWidget);
      expect(find.text('Có ít nhất 1 ký tự đặc biệt (!@#\$%^&*)'), findsOneWidget);
      expect(find.text('Cập nhật mật khẩu'), findsOneWidget);
      expect(find.textContaining('PCI DSS'), findsOneWidget);
    });

    testWidgets('submit button is disabled initially, enabled when all criteria met', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(createNewPasswordApp());
      await tester.pump();

      final button = tester.widget<ElevatedButton>(find.widgetWithText(ElevatedButton, 'Cập nhật mật khẩu'));
      expect(button.onPressed, isNull);

      // Enter valid password fulfilling all 4 rules: 8-20 chars, upper, lower, digit, special
      final textFields = find.byType(TextField);
      await tester.enterText(textFields.first, 'BankPass123!');
      await tester.enterText(textFields.last, 'BankPass123!');
      await tester.pump();

      final buttonEnabled = tester.widget<ElevatedButton>(find.widgetWithText(ElevatedButton, 'Cập nhật mật khẩu'));
      expect(buttonEnabled.onPressed, isNotNull);

      // Tap and verify navigation to success screen
      await tester.ensureVisible(find.widgetWithText(ElevatedButton, 'Cập nhật mật khẩu'));
      await tester.tap(find.widgetWithText(ElevatedButton, 'Cập nhật mật khẩu'));
      await tester.pumpAndSettle();

      expect(find.text('Reset Success Screen'), findsOneWidget);
    });
  });
}
