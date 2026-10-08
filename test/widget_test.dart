import 'package:flutter_test/flutter_test.dart';
import 'package:digibank_app/app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('DigiBankApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const DigiBankApp());
    await tester.pumpAndSettle();
    expect(find.text('DIGIBANK'), findsOneWidget);
    expect(find.text('Đăng nhập'), findsWidgets);
  });
}
