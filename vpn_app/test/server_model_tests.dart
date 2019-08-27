import 'package:test/test.dart';
import 'package:vpn_app/io/models/server_model.dart';

void main() {
  group('Server tests', () {

    test('server with index 1 should be selected at init', () {
      final ServerModel model = ServerModel();
      expect(model.selectedIndex, 1);
    });

    test('index of selected server should be changed when method is call', () {
      final ServerModel model = ServerModel();
      final int valueToTest = 10;

      model.changeServer(valueToTest);
      expect(model.selectedIndex, 1);
    });
  });
}