import 'package:sys_share_sys_account_service/pkg/pkg.dart';
import 'package:sys_share_sys_account_service/pkg/shared_repositories/auth_repo.dart'
    as authRepo;

class ForgotPasswordViewModel extends BaseModel {
  bool _hasResponse = false;
  bool _isEmailEnabled = true;

  String _userEmail = '';
  String _errMsg = '';
  String _successMsg = '';

  bool get hasResponse => _hasResponse;

  bool get isEmailEnabled => _isEmailEnabled;

  String get getEmail => _userEmail;

  String get errMsg => _errMsg;

  String get successMsg => _successMsg;

  void enableEmail(bool value) {
    _isEmailEnabled = value;
    notifyListeners();
  }

  void setEmail(String value) {
    _userEmail = value;
    notifyListeners();
  }

  void _setErrMsg(String msg) {
    _errMsg = msg;
    notifyListeners();
  }

  void _setSuccessMsg(String msg) {
    _successMsg = msg;
    notifyListeners();
  }

  void _loadingProcess(bool isInOp) {
    setBuzy(isInOp);
    enableEmail(!isInOp);
  }

  Future<void> submitEmail() async {
    _loadingProcess(true);
    await authRepo.AuthRepo.forgotPassword(email: _userEmail).then((resp) {
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
}
