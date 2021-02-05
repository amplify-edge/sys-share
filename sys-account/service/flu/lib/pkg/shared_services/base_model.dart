import 'package:flutter/cupertino.dart';

class BaseModel extends ChangeNotifier {
  bool _disposed = false;
  bool _buzy = false;
  bool get buzy => _buzy;

  void setBuzy(buzy) {
    _buzy = buzy;
    notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}
