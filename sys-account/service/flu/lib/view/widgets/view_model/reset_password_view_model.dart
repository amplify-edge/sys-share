import 'package:sys_share_sys_account_service/pkg/pkg.dart';
import 'package:sys_share_sys_account_service/pkg/shared_repositories/auth_repo.dart'
    as authRepo;

class ResetPasswordViewModel extends BaseModel {
  bool _hasResponse = false;
  bool _isEmailEnabled = true;
  bool _isPasswordEnabled = true;
  bool _isLogin = true;
  String _userEmail = '';
  String _userPassword = '';
  String _errMessage = '';
  String _successMsg = '';

  bool get hasResponse => _hasResponse;

  bool get isEmailEnabled => _isEmailEnabled;

  bool get isPasswordEnabled => _isPasswordEnabled;

  bool get isLogin => _isLogin;

  bool get isLoginParamValid => _validateEmail() && _validatePassword();

  bool get isRegisterParamValid => _validateEmail() && _validatePassword();

  String get getEmail => _userEmail;

  String get getPassword => _userPassword;

  String get successMsg => _successMsg;

  String get errMsg => _errMessage;

  void setIsLogin(bool value) {
    _isLogin = value;
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

  void _setErrMsg(String msg) {
    _errMessage = msg;
    notifyListeners();
  }

  void _setSuccessMsg(String msg) {
    _successMsg = msg;
    notifyListeners();
  }

  void _loadingProcess(bool isInOp) {
    setBuzy(isInOp);
    enableEmailField(!isInOp);
    enablePasswordField(!isInOp);
  }

  Future<void> resetPassword() async {
    _loadingProcess(true);
    await authRepo.AuthRepo.resetPassword(
            email: _userEmail,
            password: _userPassword,
            passwordConfirm: _userPassword)
        .then((resp) {
      if (resp.success) {
        _setSuccessMsg(resp.successMsg);
      } else if (resp.errorReason.hasReason()) {
        _setErrMsg(resp.errorReason.toString());
      }
      _loadingProcess(false);
    }).catchError((e) {
      print(e);
      _setErrMsg(e.toString());
    });
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
    return _userPassword.length > 8;
  }
}
