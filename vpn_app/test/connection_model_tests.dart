import 'package:test/test.dart';
import 'package:vpn_app/io/models/connection_model.dart';

void main() {
  group('Connection tests', () {

    test('connection state should ba false when init', () {
      final ConnectionModel model = ConnectionModel();
      expect(model.isConnected, false);
    });

    test('connection state must be changed when method to change is call', () {
      final ConnectionModel model = ConnectionModel();
      model.changeConnectionState();
      expect(model.isConnected, true);
    });

    test('connection state must be changed when method to change is call', () {
      final ConnectionModel model = ConnectionModel();
      model.changeConnectionState();
      expect(model.isConnected, true);
    });
  });
}