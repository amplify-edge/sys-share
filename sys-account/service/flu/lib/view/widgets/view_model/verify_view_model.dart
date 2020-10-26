import 'package:sys_share_sys_account_service/pkg/pkg.dart';
import 'package:sys_share_sys_account_service/pkg/shared_repositories/auth_repo.dart'
    as authRepo;

class VerifyAccountViewModel extends BaseModel {
  bool _hasResponse = false;
  bool _isVerifyTokenEnabled = true;

  String _userVerifyToken = '';
  String _errMsg = '';
  String _successMsg = '';

  bool get hasResponse => _hasResponse;
  bool get isVerificationValid => _validateVerifyToken();
  bool get isVerifyTokenEnabled => _isVerifyTokenEnabled;
  String get getVerifyToken => _userVerifyToken;

  String get errMsg => _errMsg;

  String get successMsg => _successMsg;

  void enableVerifyToken(bool value) {
    _isVerifyTokenEnabled = value;
    notifyListeners();
  }

  void setVerifyToken(String value) {
    _userVerifyToken = value;
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
    enableVerifyToken(!isInOp);
  }

  Future<void> submitVerifyToken() async {
    _loadingProcess(true);
    final accountId = await getTempAccountId();
    await authRepo.AuthRepo.verifyAccount(
            id: accountId, verificationToken: _userVerifyToken)
        .then((_) {
      _setSuccessMsg("account verified");
    }).catchError((e) {
      print(e);
      _setErrMsg(e.toString());
    });
    _loadingProcess(false);
  }

  String validateVerificationToken() {
    if (!_validateVerifyToken()) {
      return "Invalid Verification Token";
    }
    return null;
  }

  bool _validateVerifyToken() {
    if (_userVerifyToken.isEmpty) {
      return false;
    }
    return true;
  }
}
