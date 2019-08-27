import 'package:test/test.dart';
import 'package:vpn_app/io/models/welcome_model.dart';

void main() {
  group('Welcome tests', () {

    test('current index should be 0 at start', () {
      final WelcomeModel model = WelcomeModel();
      expect(model.currentIndex, 0);
    });

    test('vvalid value should be changed', () {
      final WelcomeModel model = WelcomeModel();
      final int valueToTest = 2;

      model.changeCurrentIndex(valueToTest);
      expect(model.currentIndex, valueToTest);
    });

    test('intro widgets length should be the same as length of the widget array', () {
      final WelcomeModel model = WelcomeModel();

      final int expectedLength = model.widgets.length;
      expect(model.widgetLength, expectedLength);
    });

    test('Last page should reflect array size minus one', () {
      final WelcomeModel model = WelcomeModel();

      final int lastPageIndex = model.widgetLength - 1;
      model.changeCurrentIndex(lastPageIndex);
      expect(model.currentIndex, lastPageIndex);
    });

    test('Change index to non existing value does not do anything', () {
      final WelcomeModel model = WelcomeModel();

      final int highRandomValue = model.widgetLength + 1000;
      model.changeCurrentIndex(highRandomValue);
      expect(model.currentIndex, 0);
    });

    test('Change index to non to negative value does not do anything', () {
      final WelcomeModel model = WelcomeModel();

      final int negativeValue = -1;
      model.changeCurrentIndex(negativeValue);
      expect(model.currentIndex, 0);
    });
  });
}
