import 'package:fixnum/fixnum.dart';
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
  Int64 _currentPageId = Int64.ZERO;
  Map<int, rpc.UserRoles> _mapRoles = Map<int, rpc.UserRoles>();
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
        print("USER IS SUPERUSER!!!");
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
    _setSubscribedOrgs(List<rpc.Org>());
  }

  Future<void> logOut() async {
    _reset();
    await authRepo.logOut();
  }

  Future<void> _fetchOrgs(
      Map<String, dynamic> filter, int perPageEntries) async {
    await orgRepo.OrgProjRepo.listUserOrgs(
      currentPageId: _currentPageId,
      orderBy: _orderBy,
      isDescending: _isDescending,
      perPageEntries: perPageEntries,
      filters: filter,
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
      List<rpc.Org> _orgs = List<rpc.Org>();
      orgIds.map((_id) async {
        await orgRepo.OrgProjRepo.getOrg(id: _id).then((_org) {
          _orgs.add(_org);
        }).catchError((e) {
          setErrMsg(e.toString());
        });
      });
    } else {
      await _fetchOrgs(Map<String, dynamic>(), perPageEntries);
    }
  }
}
