import 'package:stacked/stacked.dart';

class BaseModel extends BaseViewModel {
  bool _buzy = false;
  bool get buzy => _buzy;

  void setBuzy(buzy) {
    _buzy = buzy;
    notifyListeners();
  }
}
