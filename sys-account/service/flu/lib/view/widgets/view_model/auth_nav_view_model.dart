import 'dart:collection';
import 'dart:typed_data';

import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sys_share_sys_account_service/pkg/pkg.dart';
import 'package:sys_share_sys_account_service/pkg/shared_repositories/auth_repo.dart'
    as authRepo;
import 'package:sys_share_sys_account_service/pkg/shared_repositories/account_repo.dart'
    as accountRepo;
import 'package:sys_share_sys_account_service/pkg/shared_repositories/orgproj_repo.dart'
    as orgRepo;
import 'package:sys_share_sys_account_service/rpc/v2/sys_account_models.pb.dart'
    as rpc;

import '../nav_rail.dart';

class AuthNavViewModel extends BaseModel {
  // fields
  rpc.Account _currentAccount = rpc.Account();
  String _orderBy = 'name';
  String _accountId = '';
  String _errMsg = '';
  bool _isLoggedIn = false;
  bool _isDescending = false;
  bool _isSuperuser = false;
  bool _isAdmin = false;
  Int64 _currentPageId = Int64.ZERO;
  Map<int, rpc.UserRoles> _mapRoles = Map<int, rpc.UserRoles>();
  List<rpc.Org> _subscribedOrgs = List<rpc.Org>.empty();
  List<rpc.Project> _subscribedProjects = List<rpc.Project>.empty();
  List<Widget> _widgetList = List<Widget>.empty(growable: true);
  List<String> _widgetKeys = List<String>.empty(growable: true);
  int _previousIndex = 2;
  int _currentNavIndex = 2;
  int _nonDynamicWidgetListLength = 0;

  // getters
  bool get isSuperuser => _isSuperuser;

  bool get isAdmin => _isAdmin;

  bool get isLoggedIn => _isLoggedIn;

  int get currentNavIndex => _currentNavIndex;

  int get previousNavIndex => _previousIndex;

  List<rpc.Org> get subscribedOrgs => _subscribedOrgs;

  List<rpc.Project> get subscribedProjects => _subscribedProjects;

  List<Widget> get widgetList => _widgetList;

  String get errMsg => _errMsg;

  void setupTabItems(LinkedHashMap<String, Widget> val, BuildContext context) {
    _reset();
    _widgetKeys.add("/accounts");
    val.forEach((key, value) {
      _widgetList.add(value);
      _widgetKeys.add(key);
    });
    _setNonDynamicListLength(_widgetList.length);
  }

  int getDynamicNavIndex(String route) {
    if (route == "/") {
      return _widgetKeys.indexWhere((el) => el == route);
    } else {
      return _widgetKeys.indexWhere((el) => el != "/" && route == el);
    }
  }

  String getTabRoute(int index) {
    if (index >= _widgetKeys.length) {
      return "/";
    }
    var nextRoute = _widgetKeys.elementAt(index);
    if (nextRoute.isEmpty || nextRoute == null) {
      nextRoute = "/";
    }
    return nextRoute;
  }

  void setCurrentNavIndex(int val) {
    _currentNavIndex = val;
    notifyListeners();
  }

  void _setNonDynamicListLength(int val) {
    _nonDynamicWidgetListLength = val;
    notifyListeners();
  }

  void setPreviousNavIndex(int val) {
    _previousIndex = val;
    notifyListeners();
  }

  void _setSuperUser(bool value) {
    _isSuperuser = value;
    notifyListeners();
  }

  void _setAdmin(bool value) {
    _isAdmin = value;
    notifyListeners();
  }

  void setIsDescending(bool value) {
    _isDescending = value;
    notifyListeners();
  }

  void setOrderBy(String value) {
    _orderBy = value;
    notifyListeners();
  }

  void setCurrentPageId(Int64 value) {
    _currentPageId = value;
    notifyListeners();
  }

  void _setAccountId(String value) {
    _accountId = value;
    notifyListeners();
  }

  void _setCurrentAccount(rpc.Account account) {
    _currentAccount = account;
    notifyListeners();
  }

  void _setSubscribedOrgs(List<rpc.Org> value) {
    _subscribedOrgs = value;
    notifyListeners();
  }

  void setErrMsg(String value) {
    _errMsg = value;
    notifyListeners();
  }

  Future<void> isUserLoggedIn() async {
    _isLoggedIn = await authRepo.isLoggedIn();
    notifyListeners();
  }

  Future<void> _fetchAccountId() async {
    if (_accountId.isEmpty) {
      final accountId = await getAccountId();
      _setAccountId(accountId);
      await _fetchCurrentAccount();
      if (_currentAccount.id.isNotEmpty) {
        _setAccountId(_currentAccount.id);
      }
    }
  }

  Future<void> _fetchCurrentAccount() async {
    final currentUser = await accountRepo.UserRepo.getAccount(id: _accountId);
    _setCurrentAccount(currentUser);
  }

  Future<void> verifySuperuser() async {
    if (_isLoggedIn) {
      await _fetchAccountId();
      final _isSuperAdmin = authRepo.isSuperAdmin(_currentAccount);
      if (_isSuperAdmin) {
        _setSuperUser(true);
      }
    }
  }

  Future<void> verifyAdmin() async {
    if (_isLoggedIn) {
      await _fetchAccountId();
      _mapRoles = authRepo.isAdmin(_currentAccount);
      notifyListeners();
      if (_mapRoles.isNotEmpty) {
        _setAdmin(true);
      }
    }
  }

  void _reset() {
    _isLoggedIn = false;
    notifyListeners();
    setCurrentPageId(Int64.ZERO);
    _setAccountId('');
    _setSuperUser(false);
    _setAdmin(false);
    _setCurrentAccount(rpc.Account());
    _setSubscribedOrgs(List<rpc.Org>.empty(growable: true));
    _widgetList = _widgetList.sublist(0, _nonDynamicWidgetListLength);
    _widgetKeys = _widgetKeys.sublist(0, _nonDynamicWidgetListLength);
  }

  Future<void> logOut() async {
    await authRepo.logOut();
    _reset();
  }

  Future<void> _fetchOrgs(
      Map<String, dynamic> filter, int perPageEntries, String matcher) async {
    await orgRepo.OrgProjRepo.listUserOrgs(
      currentPageId: _currentPageId,
      orderBy: _orderBy,
      isDescending: _isDescending,
      perPageEntries: perPageEntries,
      filters: filter,
      matcher: matcher,
    ).then((resp) {
      setCurrentPageId(Int64.parseInt(resp.nextPageId));
      _setSubscribedOrgs(resp.orgs);
    }).catchError((e) {
      setErrMsg(e.toString());
    });
  }

  Future<void> getSubscribedOrgs({perPageEntries = 10}) async {
    if (_currentAccount.id.isEmpty) {
      await _fetchAccountId();
    }
    await verifySuperuser();
    await verifyAdmin();
    if (!_isSuperuser) {
      final orgIds = authRepo.getSubscribedOrgs(_currentAccount);
      await _fetchOrgs({"id": orgIds}, perPageEntries, "in");
    } else {
      await _fetchOrgs(Map<String, dynamic>(), perPageEntries, "like");
    }
    _subscribedOrgs.forEach((org) {
      final _namedRoute = '/disco/projects/' + org.id;
      _widgetKeys.add(_namedRoute);
      _widgetList.add(TabItem(
        icon: ClipOval(
          child: Image.memory(
            Uint8List.fromList(org.logo),
            width: 30,
            height: 30,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(org.name, style: TextStyle(fontSize: 12)),
        onTap: () {
          Modular.to.pushNamed('/disco/projects', arguments: [org]);
        },
      ));
    });
  }
}
