import 'package:meta/meta.dart';
import 'package:sys_share_sys_account_service/pkg/pkg.dart';
import 'package:sys_share_sys_account_service/pkg/shared_repositories/auth_repo.dart'
    as authRepo;

class VerifyAccountViewModel extends BaseModel {
  bool _hasResponse = false;
  bool _isVerifyTokenEnabled = true;
  bool _isObscured = true;

  String _userVerifyToken = '';
  String _errMsg = '';
  String _successMsg = '';
  String _accountId = '';

  bool get hasResponse => _hasResponse;

  bool get isVerificationValid => _validateVerifyToken();

  bool get isVerifyTokenEnabled => _isVerifyTokenEnabled;

  bool get isObscured => _isObscured;

  String get getVerifyToken => _userVerifyToken;

  String get errMsg => _errMsg;

  String get successMsg => _successMsg;

  // constructor
  VerifyAccountViewModel({@required String accountId}) {
    this._accountId = accountId;
    notifyListeners();
  }

  void enableVerifyToken(bool value) {
    _isVerifyTokenEnabled = value;
    notifyListeners();
  }

  void setObscured(bool val) {
    _isObscured = val;
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
    String accountId = _accountId;
    if (accountId == null) {
      accountId = await getTempAccountId();
    }
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
