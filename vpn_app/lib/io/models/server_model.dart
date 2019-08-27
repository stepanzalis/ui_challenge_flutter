
import 'package:flutter/cupertino.dart';
import 'package:vpn_app/io/models/vpn_server.dart';

class ServerModel with ChangeNotifier {

  VpnServer _selectedServer = servers[1];

  int get selectedIndex => _selectedServer.index;
  VpnServer get selectedServer => _selectedServer;

  void changeServer(int index) {
    if (index < 0 || index > servers.length - 1) return null;

    _selectedServer = servers[index];
    notifyListeners();
  }

  static final servers = [
    VpnServer('Automatic', 'us.svg', 0),
    VpnServer('New York, NY', 'us.svg', 1),
    VpnServer('London', 'uk.svg', 2),
    VpnServer('Moscow', 'russia.svg', 3),
    VpnServer('Stockholm', 'sweden.svg', 4),
    VpnServer('Melbourne', 'australia.svg', 5),
    VpnServer('New Deplhi', 'india.svg', 6),
    VpnServer('Singapore', 'india.svg', 7),
  ];
}