import 'package:sys_share_sys_account_service/pkg/pkg.dart';
import 'package:sys_share_sys_account_service/pkg/shared_repositories/auth_repo.dart'
    as authRepo;
import 'package:sys_share_sys_account_service/pkg/shared_repositories/account_repo.dart'
    as accountRepo;
import 'package:sys_share_sys_account_service/pkg/shared_repositories/orgproj_repo.dart'
    as orgRepo;
import 'package:sys_share_sys_account_service/rpc/v2/sys_account_models.pb.dart'
    as rpc;

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
  int _currentPageId = 0;
  Map<String, dynamic> _filters = Map<String, dynamic>();
  List<rpc.Org> _subscribedOrgs = List<rpc.Org>();
  List<rpc.Project> _subscribedProjects = List<rpc.Project>();

  // getters
  bool get isSuperuser => _isSuperuser;

  bool get isAdmin => _isAdmin;

  bool get isLoggedIn => _isLoggedIn;

  List<rpc.Org> get subscribedOrgs => _subscribedOrgs;

  List<rpc.Project> get subscribedProjects => _subscribedProjects;

  String get errMsg => _errMsg;

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

  void setCurrentPageId(int value) {
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
      await _fetchCurrentAccount();
      if (_currentAccount.id.isNotEmpty) {
        print("CURRENT USER ID: " + _currentAccount.id);
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
      if (_currentAccount.role.role == rpc.Roles.SUPERADMIN) {
        _setSuperUser(true);
      }
    }
  }

  Future<void> verifyAdmin() async {
    if (_isLoggedIn) {
      await _fetchAccountId();
      if (_currentAccount.role.role == rpc.Roles.ADMIN) {
        _setAdmin(true);
      }
    }
  }

  void _reset() {
    _isLoggedIn = false;
    notifyListeners();
    setCurrentPageId(0);
    _setAccountId('');
    _setSuperUser(false);
    _setAdmin(false);
    _setCurrentAccount(rpc.Account());
    _setSubscribedOrgs(List<rpc.Org>());
  }

  Future<void> logOut() async {
    _reset();
    await authRepo.logOut();
  }

  Future<void> getSubscribedOrgs({perPageEntries = 10}) async {
    if (_currentAccount.id.isEmpty) {
      await _fetchAccountId();
    }
    await verifySuperuser();
    print("USER IS SUPERUSER? " + _isSuperuser.toString());
    await verifyAdmin();
    print("USER IS ADMIN? " + _isSuperuser.toString());
    print("CURRENT USER ROLE: " + _currentAccount.role.toString());
    if (_currentAccount.hasRole() && _currentAccount.role.hasOrgId()) {
      orgRepo.OrgProjRepo.listUserOrgs(
        currentPageId: _currentPageId.toString(),
        orderBy: _orderBy,
        isDescending: _isDescending,
        perPageEntries: perPageEntries,
      ).then((resp) {
        setCurrentPageId(int.parse(resp.nextPageId));
        _setSubscribedOrgs(resp.orgs);
      }).catchError((e) {
        setErrMsg(e.toString());
      });
    } else if (_currentAccount.hasRole() && _isSuperuser) {
      print("FETCHING ALL ORGS");
      orgRepo.OrgProjRepo.listUserOrgs(
        currentPageId: _currentPageId.toString(),
        orderBy: _orderBy,
        isDescending: _isDescending,
        perPageEntries: perPageEntries,
      ).then((resp) {
        setCurrentPageId(int.parse(resp.nextPageId));
        _setSubscribedOrgs(resp.orgs);
        print("ALL ORGS: " + _subscribedOrgs.toString());
      }).catchError((e) {
        setErrMsg(e.toString());
      });
    }
  }
}
