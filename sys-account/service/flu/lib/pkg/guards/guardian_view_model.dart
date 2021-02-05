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
  String _accountId = getAccountId();
  String _errMsg = '';
  bool _isUserSuperuser = false;
  bool _isUserLoggedIn = false;
  bool _isUserAdmin = false;

  Account get currentAccount => _currentAccount;

  String get accountId => getAccountId();

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

  void _isLoggedIn() {
    final isLoggedOn = isLoggedIn();
    _isUserLoggedIn = isLoggedOn;
    notifyListeners();
  }

  void getLoginStatus() {
    _isLoggedIn();
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

  void fetchAccountId() {
    if (_accountId.isEmpty) {
      final accountId = getAccountId();
      _setAccountId(accountId);
      if (_currentAccount.id.isNotEmpty) {
        _setAccountId(_currentAccount.id);
      }
    }
  }

  void verifySuperuser() {
    if (_isUserLoggedIn) {
      fetchAccountId();
      final _isSuperAdmin = isSuperAdmin();
      if (_isSuperAdmin) {
        _setSuperUser(true);
      }
    }
  }

  void verifyAdmin() {
    if (_isUserLoggedIn) {
      fetchAccountId();
      _mapRoles = isAdmin();
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

  void checkUserLoggedIn(BuildContext context) {
    _isLoggedIn();
    if (!_isUserLoggedIn) {
      setErrMsg(context, 'cannot access page, user is not logged in');
      return;
    }
  }

  void _grantSuperAccess(BuildContext context, Widget widget) {
    checkUserLoggedIn(context);
    if (_currentAccount.id.isEmpty) {
      fetchAccountId();
    }
    verifySuperuser();
    if (!_isUserSuperuser) {
      setErrMsg(context, "cannot access page, user is not authorized");
      return;
    }
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext ctx) => widget));
  }
}
