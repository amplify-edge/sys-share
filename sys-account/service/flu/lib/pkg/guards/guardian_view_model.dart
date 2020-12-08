import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sys_core/sys_core.dart';
import 'package:sys_share_sys_account_service/pkg/shared_repositories/account_repo.dart';
import 'package:sys_share_sys_account_service/pkg/shared_repositories/auth_repo.dart';
import 'package:sys_share_sys_account_service/sys_share_sys_account_service.dart';

class GuardianViewModel extends ChangeNotifier {
  Account _currentAccount = Account();
  Map<int, UserRoles> _mapRoles = Map<int, UserRoles>();
  String _accountId = '';
  String _errMsg = '';
  bool _isUserSuperuser = false;
  bool _isUserLoggedIn = false;
  bool _isUserAdmin = false;

  Account get currentAccount => _currentAccount;

  bool get isUserSuperuser => _isUserSuperuser;

  bool get isUserAdmin => _isUserAdmin;

  bool get isUserLoggedIn => _isUserLoggedIn;

  void _setSuperUser(bool value) {
    _isUserSuperuser = value;
    notifyListeners();
  }

  void _setAdmin(bool value) {
    _isUserAdmin = value;
    notifyListeners();
  }

  Future<void> _isLoggedIn() async {
    final isLoggedOn = await isLoggedIn();
    _isUserLoggedIn = isLoggedOn;
    notifyListeners();
  }
  
  Future<void> getLoginStatus() async {
    await _isLoggedIn();
  }

  void _setAccountId(String value) {
    _accountId = value;
    notifyListeners();
  }

  void _setCurrentAccount(Account account) {
    _currentAccount = account;
    notifyListeners();
  }

  void setErrMsg(BuildContext context, String val) {
    _errMsg = val;
    notify(
      context: context,
      message: _errMsg,
      error: true,
    );
    Modular.to.pop(context);
  }

  Future<void> _fetchCurrentAccount() async {
    final currentUser = await UserRepo.getAccount(id: _accountId);
    _setCurrentAccount(currentUser);
  }

  Future<void> fetchAccountId() async {
    if (_accountId.isEmpty) {
      final accountId = await getAccountId();
      _setAccountId(accountId);
      await _fetchCurrentAccount();
      if (_currentAccount.id.isNotEmpty) {
        _setAccountId(_currentAccount.id);
      }
    }
  }

  Future<void> verifySuperuser() async {
    if (_isUserLoggedIn) {
      await fetchAccountId();
      final _isSuperAdmin = isSuperAdmin(_currentAccount);
      if (_isSuperAdmin) {
        _setSuperUser(true);
      }
    }
  }

  Future<void> verifyAdmin() async {
    if (_isUserLoggedIn) {
      await fetchAccountId();
      _mapRoles = isAdmin(_currentAccount);
      notifyListeners();
      if (_mapRoles.isNotEmpty) {
        _setAdmin(true);
      }
    }
  }

  Future<void> getPermissions(
      {@required BuildContext context,
      @required Widget widget,
      Future<void> Function(BuildContext context, Widget widget)
          grantAccessFunction}) async {
    if (grantAccessFunction == null) {
      grantAccessFunction = _grantSuperAccess;
    }
    await grantAccessFunction(context, widget);
  }

  Future<void> checkUserLoggedIn(BuildContext context) async {
    await _isLoggedIn();
    if (!_isUserLoggedIn) {
      setErrMsg(context, 'cannot access page, user is not logged in');
      return;
    }
  }

  Future<void> _grantSuperAccess(BuildContext context, Widget widget) async {
    await checkUserLoggedIn(context);
    if (_currentAccount.id.isEmpty) {
      await fetchAccountId();
    }
    await verifySuperuser();
    if (!_isUserSuperuser) {
      setErrMsg(context, "cannot access page, user is not authorized");
      return;
    }
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext ctx) => widget));
  }
}
