import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:digibank_app/modules/home/presentation/pages/home_page.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget createHomePage() {
    return const MaterialApp(
      home: HomePage(),
    );
  }

  group('HomePage Widget Tests', () {
    testWidgets('renders all user profile, balance, quick actions and transaction elements', (tester) async {
      await tester.pumpWidget(createHomePage());
      await tester.pump();

      // Top bar
      expect(find.text('NA'), findsOneWidget);
      expect(find.text('Xin chào,'), findsOneWidget);
      expect(find.text('Nguyễn Văn An'), findsOneWidget);

      // Balance Card
      expect(find.text('128.450.000 đ'), findsOneWidget);
      expect(find.text('Số dư khả dụng'), findsOneWidget);
      expect(find.text('STK: 1088 •••• 9928'), findsOneWidget);
      expect(find.text('Sao chép'), findsOneWidget);

      // Quick action cards
      expect(find.text('Chuyển tiền'), findsWidgets);
      expect(find.text('Hóa đơn'), findsOneWidget);
      expect(find.text('Nạp tiền'), findsOneWidget);

      // Recent Transactions
      expect(find.text('Giao dịch gần đây'), findsOneWidget);
      expect(find.text('Xem tất cả'), findsOneWidget);
      expect(find.text('Trần Thị Mai'), findsOneWidget);
      expect(find.text('+2.500.000 đ'), findsOneWidget);
      expect(find.text('Điện lực EVN Hà Nội'), findsOneWidget);
      expect(find.text('-845.000 đ'), findsOneWidget);

      // Bottom Nav Bar tabs
      expect(find.text('Trang chủ'), findsOneWidget);
      expect(find.text('Quét QR'), findsOneWidget);
      expect(find.text('Thông báo'), findsOneWidget);
      expect(find.text('Cài đặt'), findsOneWidget);
    });

    testWidgets('toggles balance visibility on BalanceCard hide/show button', (tester) async {
      await tester.pumpWidget(createHomePage());
      await tester.pump();

      expect(find.text('128.450.000 đ'), findsOneWidget);
      expect(find.text('Ẩn'), findsOneWidget);

      await tester.tap(find.text('Ẩn'));
      await tester.pumpAndSettle();

      expect(find.text('Hiện'), findsOneWidget);
      expect(find.text('••••••••••••'), findsOneWidget);
    });
  });
}
