import 'package:sys_share_sys_account_service/pkg/pkg.dart';
import 'package:sys_share_sys_account_service/pkg/shared_repositories/auth_repo.dart'
    as authRepo;

class ResetPasswordViewModel extends BaseModel {
  bool _hasResponse = false;
  bool _isEmailEnabled = true;
  bool _isPasswordEnabled = true;
  bool _isVerificationFieldEnabled = true;
  bool _isLogin = true;
  bool _isPasswordObscured = true;
  String _userEmail = '';
  String _userPassword = '';
  String _verificationToken = '';
  String _errMessage = '';
  String _successMsg = '';

  bool get hasResponse => _hasResponse;

  bool get isEmailEnabled => _isEmailEnabled;

  bool get isPasswordEnabled => _isPasswordEnabled;

  bool get isVerificationFieldEnabled => _isVerificationFieldEnabled;
  bool get isPasswordObscured => _isPasswordObscured;

  bool get isLogin => _isLogin;

  bool get isResetPasswordValid =>
      _validateEmail() && _validatePassword() && _validateVerificationToken();

  String get getEmail => _userEmail;

  String get getPassword => _userPassword;

  String get getVerificationTokenText => _verificationToken;

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

  void enableVerificationField(bool value) {
    _isVerificationFieldEnabled = value;
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

  void setVerificationTokenText(String value) {
    _verificationToken = value;
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

  void setPasswordObscured(bool value) {
    _isPasswordObscured = value;
    notifyListeners();
  }

  void _loadingProcess(bool isInOp) {
    setBuzy(isInOp);
    enableEmailField(!isInOp);
    enablePasswordField(!isInOp);
    enableVerificationField(!isInOp);
  }

  Future<void> resetPassword() async {
    _loadingProcess(true);
    print("current verification token: " + _verificationToken);
    await authRepo.AuthRepo.resetPassword(
      email: _userEmail,
      password: _userPassword,
      passwordConfirm: _userPassword,
      verificationToken: _verificationToken,
    ).then((resp) {
      if (resp.success) {
        _setSuccessMsg(resp.successMsg);
      } else if (resp.errorReason.hasReason()) {
        _setErrMsg(resp.errorReason.toString());
      }
    }).catchError((e) {
      print(e);
      _setErrMsg(e.toString());
    });
    _loadingProcess(false);
  }

  String validateEmailText() {
    if (!_validateEmail()) {
      return sysAccountTranslate('invalidEmail');
    }
    return null;
  }

  String validatePasswordText() {
    if (!_validatePassword()) {
      return sysAccountTranslate('invalidPassword');
    }
    return null;
  }

  String validateVerificationTokenText() {
    if (!_validateVerificationToken()) {
      return sysAccountTranslate('invalidVerificationToken');
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

  bool _validateVerificationToken() {
    if (_verificationToken.isEmpty) {
      return false;
    }
    return true;
  }
}
