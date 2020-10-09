import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  bool _buzy = false;
  bool get buzy => _buzy;

  void setBuzy(buzy) {
    _buzy = buzy;
    notifyListeners();
  }
}
