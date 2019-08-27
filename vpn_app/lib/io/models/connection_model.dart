
import 'package:flutter/cupertino.dart';

class ConnectionModel with ChangeNotifier {

  bool _connected = false;
  bool get isConnected => _connected;

  String get connectionStateTitle => isConnected ? 'CONNECTED' : 'DISCONNECTED';
  String get buttonTitle => isConnected ? 'DISCONNECT' : 'CONNECT NOW';

  void changeConnectionState() {
    _connected = !_connected;
    notifyListeners();
  }
}