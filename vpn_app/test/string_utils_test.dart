import 'package:test/test.dart';
import 'package:vpn_app/util/string.dart';

void main() {
  test('capitalize function should return string with first letter uppercased', () {

    final String normalText = "test";
    final String upperCasedText = capitalize(normalText);

    expect(upperCasedText, "Test");
  });
}