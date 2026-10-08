import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:digibank_app/core/routes/app_routes.dart';
import 'package:digibank_app/modules/auth/presentation/pages/login_page.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget createLoginPage() {
    return MaterialApp(
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (context) => const LoginPage(),
        AppRoutes.home: (context) => const Scaffold(body: Text('Home Screen')),
        AppRoutes.accountVerification: (context) => const Scaffold(body: Text('Verify Account Screen')),
      },
    );
  }

  group('LoginPage Widget Tests', () {
    testWidgets('renders all essential branding and input fields', (tester) async {
      await tester.pumpWidget(createLoginPage());
      await tester.pump();

      expect(find.text('DIGIBANK'), findsOneWidget);
      expect(find.text('NGÂN HÀNG SỐ AN TOÀN'), findsOneWidget);
      expect(find.text('Đăng nhập'), findsWidgets);
      expect(find.text('Tên đăng nhập / Mã khách hàng'), findsOneWidget);
      expect(find.text('Mật khẩu'), findsOneWidget);
      expect(find.text('Ghi nhớ tên đăng nhập'), findsOneWidget);
      expect(find.text('Quên mật khẩu?'), findsOneWidget);
      expect(find.text('Đăng nhập bằng Face ID'), findsOneWidget);
      expect(find.text('Bảo mật mã hóa 256-bit SSL & PCI DSS'), findsOneWidget);
      expect(find.textContaining('1900 6868'), findsOneWidget);
    });

    testWidgets('navigates to account verification screen when tapping Quên mật khẩu?', (tester) async {
      await tester.pumpWidget(createLoginPage());
      await tester.pump();

      await tester.tap(find.text('Quên mật khẩu?'));
      await tester.pumpAndSettle();

      expect(find.text('Verify Account Screen'), findsOneWidget);
    });

    testWidgets('shows validation error when entering short password and clicking login', (tester) async {
      await tester.pumpWidget(createLoginPage());
      await tester.pump();

      // Enter username and short password
      await tester.enterText(
        find.widgetWithText(TextField, '').first,
        'user01',
      );
      await tester.enterText(
        find.widgetWithText(TextField, '').last,
        '123',
      );
      await tester.pump();

      // Tap Đăng nhập button
      final loginButton = find.widgetWithText(ElevatedButton, 'Đăng nhập');
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      expect(find.text('Mật khẩu phải từ 6 ký tự trở lên'), findsOneWidget);
    });

    testWidgets('navigates to Home when login credentials are valid', (tester) async {
      await tester.pumpWidget(createLoginPage());
      await tester.pump();

      await tester.enterText(
        find.widgetWithText(TextField, '').first,
        '0982888668',
      );
      await tester.enterText(
        find.widgetWithText(TextField, '').last,
        'password123',
      );
      await tester.pump();

      final loginButton = find.widgetWithText(ElevatedButton, 'Đăng nhập');
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      expect(find.text('Home Screen'), findsOneWidget);
    });
  });
}
