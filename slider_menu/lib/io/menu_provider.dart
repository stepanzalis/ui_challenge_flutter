import 'package:flutter/material.dart';

class MenuProvider with ChangeNotifier {

  bool _open = false;
  int _selectedId = 0;

  bool get isOpen => _open;
  int get getSelected => _selectedId;

  changeSelectedPage(selected) {
    _selectedId = selected;
    debugPrint(selected.toString());
  }

  toggleMenuPanel() {
    _open = !_open;
    notifyListeners();
  }
}