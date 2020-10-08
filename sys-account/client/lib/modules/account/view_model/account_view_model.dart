import 'package:auth_dialog/core/core.dart';
import 'package:auth_dialog/core/shared_repositories/auth_repo.dart'
    as authRepo;

class AccountViewModel extends BaseModel {
  bool _hasResponse = false;
  bool _isEmailEnabled = true;
  bool _isPasswordEnabled = true;
  String _userEmail = 'superadmin@getcouragenow.org';
  String _userPassword = 'superadmin';
  String _refreshToken = '';
  String _accessToken = '';

  bool get hasResponse => _hasResponse;
  bool get isEmailEnabled => _isEmailEnabled;
  bool get isPasswordEnabled => _isPasswordEnabled;
  String get getEmail => _userEmail;
  String get getPassword => _userPassword;
  String get accessToken => _accessToken;
  String get refreshToken => _refreshToken;

  void setAccessToken(String value) {
    _accessToken = value;
    notifyListeners();
  }

  void enableEmailField(bool value) {
    _isEmailEnabled = value;
    notifyListeners();
  }

  void enablePasswordField(bool value) {
    _isPasswordEnabled = value;
    notifyListeners();
  }

  void setEmail(String value) {
    _userEmail = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _userPassword = value;
    notifyListeners();
  }

  Future<String> submitLogin() async {
    try {
      authRepo.AuthRepo.loginUser(email: _userEmail, password: _userPassword).then((resp) => {
        _accessToken = resp.accessToken;
        _refreshToken = resp.refreshToken;
        return _accessToken;
      });
    } catch (e) {
      throw e;
    }
  }

  String validateEmailText() {
    if (!_validateEmail()) {
      return 'Invalid email';
    }
    return null;
  }

  String validatePasswordText() {
    if (!_validatePassword()) {
      return 'Invalid password length';
    }
    return null;
  }

  bool _validateEmail() {
    if (_userEmail.isEmpty) {
      return false;
    }
    return _userEmail.contains(RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"));
  }

  bool _validatePassword() {
    if (_userPassword.isEmpty) {
      return false;
    }
    return _userPassword.length < 8;
  }
}
