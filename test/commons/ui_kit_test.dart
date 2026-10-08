import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:digibank_app/commons/button/app_primary_button.dart';
import 'package:digibank_app/commons/button/app_secondary_button.dart';
import 'package:digibank_app/commons/input/app_text_field.dart';
import 'package:digibank_app/commons/selection/app_checkbox.dart';
import 'package:digibank_app/commons/badge/security_badge.dart';
import 'package:digibank_app/commons/feedback/notice_banner_box.dart';
import 'package:digibank_app/commons/card/balance_gradient_card.dart';

void main() {
  Widget wrap(Widget child) {
    return MaterialApp(
      home: Scaffold(body: SingleChildScrollView(child: child)),
    );
  }

  group('UI Kit Components Test', () {
    testWidgets('AppPrimaryButton renders and triggers tap', (tester) async {
      bool tapped = false;
      await tester.pumpWidget(wrap(
        AppPrimaryButton(
          title: 'Đăng nhập',
          onPressed: () => tapped = true,
        ),
      ));

      expect(find.text('Đăng nhập'), findsOneWidget);
      await tester.tap(find.text('Đăng nhập'));
      expect(tapped, isTrue);
    });

    testWidgets('AppSecondaryButton renders with outline styling', (tester) async {
      await tester.pumpWidget(wrap(
        AppSecondaryButton(
          title: 'Face ID',
          onPressed: () {},
        ),
      ));

      expect(find.text('Face ID'), findsOneWidget);
    });

    testWidgets('AppTextField toggles obscure password visibility', (tester) async {
      final controller = TextEditingController(text: 'secret123');
      await tester.pumpWidget(wrap(
        AppTextField(
          controller: controller,
          label: 'Mật khẩu',
          obscureText: true,
        ),
      ));

      expect(find.text('Mật khẩu'), findsOneWidget);
      expect(find.byIcon(Icons.visibility_off_outlined), findsOneWidget);

      await tester.tap(find.byIcon(Icons.visibility_off_outlined));
      await tester.pump();

      expect(find.byIcon(Icons.visibility_outlined), findsOneWidget);
    });

    testWidgets('AppCheckbox toggles state on tap', (tester) async {
      bool checked = false;
      await tester.pumpWidget(StatefulBuilder(
        builder: (context, setState) {
          return wrap(
            AppCheckbox(
              value: checked,
              label: 'Ghi nhớ',
              onChanged: (val) => setState(() => checked = val),
            ),
          );
        },
      ));

      expect(find.text('Ghi nhớ'), findsOneWidget);
      expect(find.byIcon(Icons.check_rounded), findsNothing);

      await tester.tap(find.text('Ghi nhớ'));
      await tester.pump();

      expect(checked, isTrue);
      expect(find.byIcon(Icons.check_rounded), findsOneWidget);
    });

    testWidgets('SecurityBadge renders label and icon', (tester) async {
      await tester.pumpWidget(wrap(
        const SecurityBadge(label: 'Bảo mật SSL 256-bit'),
      ));

      expect(find.text('Bảo mật SSL 256-bit'), findsOneWidget);
    });

    testWidgets('NoticeBannerBox renders title and message', (tester) async {
      await tester.pumpWidget(wrap(
        const NoticeBannerBox(
          title: 'Nguyên tắc an toàn',
          message: 'Không chia sẻ mật khẩu',
        ),
      ));

      expect(find.text('Nguyên tắc an toàn'), findsOneWidget);
      expect(find.text('Không chia sẻ mật khẩu'), findsOneWidget);
    });

    testWidgets('BalanceGradientCard toggles masked balance', (tester) async {
      await tester.pumpWidget(wrap(
        const BalanceGradientCard(
          balance: '100.000.000 đ',
          accountNumber: 'STK: 12345678',
        ),
      ));

      expect(find.text('100.000.000 đ'), findsOneWidget);
      expect(find.text('STK: 12345678'), findsOneWidget);

      await tester.tap(find.text('Ẩn'));
      await tester.pumpAndSettle();

      expect(find.text('Hiện'), findsOneWidget);
      expect(find.text('••••••••••••'), findsOneWidget);
    });
  });
}
