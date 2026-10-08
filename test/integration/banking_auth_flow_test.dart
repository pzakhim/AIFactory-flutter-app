import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:digibank_app/app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Complete Banking Authentication & Recovery Flow E2E Integration Test', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.resetPhysicalSize);

    // 1. Launch DigiBank Application (Starts at UIT-01: LoginPage)
    await tester.pumpWidget(const DigiBankApp());
    await tester.pumpAndSettle();

    expect(find.text('DIGIBANK'), findsOneWidget);
    expect(find.text('Đăng nhập'), findsWidgets);

    // 2. User taps 'Quên mật khẩu?' to initiate password recovery (Navigates to UIT-03)
    await tester.ensureVisible(find.text('Quên mật khẩu?'));
    await tester.tap(find.text('Quên mật khẩu?'));
    await tester.pumpAndSettle();

    expect(find.text('Khôi phục mật khẩu'), findsOneWidget);
    expect(find.text('Xác thực tài khoản'), findsOneWidget);

    // 3. User verifies account and submits OTP request (Navigates to UIT-04)
    await tester.ensureVisible(find.widgetWithText(ElevatedButton, 'Gửi mã OTP'));
    await tester.tap(find.widgetWithText(ElevatedButton, 'Gửi mã OTP'));
    await tester.pumpAndSettle();

    expect(find.text('Xác minh OTP'), findsOneWidget);
    expect(find.text('Nhập mã xác thực'), findsOneWidget);

    // 4. User inputs 6 OTP digits (Navigates to UIT-05)
    final otpFields = find.byType(TextField);
    for (int i = 0; i < 6; i++) {
      await tester.enterText(otpFields.at(i), '${i + 1}');
    }
    await tester.pump();

    await tester.ensureVisible(find.widgetWithText(ElevatedButton, 'Xác nhận OTP'));
    await tester.tap(find.widgetWithText(ElevatedButton, 'Xác nhận OTP'));
    await tester.pumpAndSettle();

    expect(find.text('Đặt mật khẩu mới'), findsOneWidget);
    expect(find.text('Thiết lập mật khẩu an toàn'), findsOneWidget);

    // 5. User enters compliant new password and confirmation
    final passwordFields = find.byType(TextField);
    await tester.enterText(passwordFields.first, 'DigiBank2026@');
    await tester.enterText(passwordFields.last, 'DigiBank2026@');
    await tester.pump();

    // 6. User submits new password (Navigates to UIT-06)
    await tester.ensureVisible(find.widgetWithText(ElevatedButton, 'Cập nhật mật khẩu'));
    await tester.tap(find.widgetWithText(ElevatedButton, 'Cập nhật mật khẩu'));
    await tester.pumpAndSettle();

    expect(find.text('Đổi mật khẩu thành công'), findsOneWidget);
    expect(find.text('Chi tiết cập nhật bảo mật'), findsOneWidget);

    // 7. User taps 'Quay lại đăng nhập' (Navigates back to UIT-01, clearing auth stack)
    await tester.ensureVisible(find.widgetWithText(ElevatedButton, 'Quay lại đăng nhập'));
    await tester.tap(find.widgetWithText(ElevatedButton, 'Quay lại đăng nhập'));
    await tester.pumpAndSettle();

    expect(find.text('DIGIBANK'), findsOneWidget);
    expect(find.text('Đăng nhập'), findsWidgets);

    // 8. User logs into application with valid credentials (Navigates to UIT-02: HomePage)
    final loginFields = find.byType(TextField);
    await tester.enterText(loginFields.first, '0982888668');
    await tester.enterText(loginFields.last, 'DigiBank2026@');
    await tester.pump();

    await tester.ensureVisible(find.widgetWithText(ElevatedButton, 'Đăng nhập'));
    await tester.tap(find.widgetWithText(ElevatedButton, 'Đăng nhập'));
    await tester.pumpAndSettle();

    // Verify User has reached Home Screen with balance and recent transactions
    expect(find.text('Xin chào,'), findsOneWidget);
    expect(find.text('Nguyễn Văn An'), findsOneWidget);
    expect(find.text('128.450.000 đ'), findsOneWidget);
    expect(find.text('Giao dịch gần đây'), findsOneWidget);
    expect(find.text('Trang chủ'), findsOneWidget);
  });
}
