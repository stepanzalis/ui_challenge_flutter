import 'package:flutter_test/flutter_test.dart';

import 'package:vpn_app/main.dart';

void main() {
  testWidgets('smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(VpnApp());
  });
}
