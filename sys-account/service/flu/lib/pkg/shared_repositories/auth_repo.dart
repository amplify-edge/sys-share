import 'package:sys_core/pkg/shared_repositories/base_repo.dart';
import 'package:sys_share_sys_account_service/rpc/v2/sys_account_models.pb.dart';
import 'package:sys_share_sys_account_service/sys_share_sys_account_service.dart'
    as rpc;
import 'package:grpc/grpc_web.dart';
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:hive/hive.dart';

class AuthRepo extends BaseRepo {
  static Future<rpc.LoginResponse> loginUser(
      {@required String email, @required String password}) async {
    final req = rpc.LoginRequest()
      ..email = email
      ..password = password;

    try {
      final client = await _authClient();
      final resp = await client.login(req).then((res) {
        return res;
      });
      updateTokens(
        accessToken: resp.accessToken,
        refreshToken: resp.refreshToken,
      );
      return resp;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  static Future<rpc.RegisterResponse> registerAccount({
    @required String email,
    @required String password,
    @required String passwordConfirm,
    // UserRoles initialRole,
  }) async {
    if (password != passwordConfirm) {
      rpc.RegisterResponse resp = rpc.RegisterResponse.getDefault()
        ..success = false
        ..errorReason = rpc.ErrorReason()
        ..errorReason.reason = "password mismatch";
      return resp;
    }

    try {
      final client = await _authClient();
      final request = rpc.RegisterRequest()
        ..email = email
        ..password = password
        ..passwordConfirm = passwordConfirm;
      // if (initialRole != null) {
      //   request..userRole = initialRole;
      // }
      final resp = await client.register(request);
      if (resp.hasVerifyToken()) {
        print(resp.verifyToken);
      }
      insertTempAccountId(tempAccountId: resp.tempUserId);
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<rpc.ForgotPasswordResponse> forgotPassword(
      {@required String email}) async {
    final req = rpc.ForgotPasswordRequest()..email = email;
    try {
      final client = await _authClient();
      return await client.forgotPassword(req);
    } catch (e) {
      throw e;
    }
  }

  static Future<rpc.ResetPasswordResponse> resetPassword({
    @required String email,
    @required String password,
    @required String passwordConfirm,
    @required String verificationToken,
  }) async {
    final req = rpc.ResetPasswordRequest()
      ..email = email
      ..password = password
      ..passwordConfirm = passwordConfirm
      ..verifyToken = verificationToken;

    try {
      final client = await _authClient();
      return await client.resetPassword(req);
    } catch (e) {
      print(e);
      throw e;
    }
  }

  static Future<rpc.RefreshAccessTokenResponse> renewAccessToken(
      {@required String refreshToken}) async {
    final req = rpc.RefreshAccessTokenRequest()..refreshToken = refreshToken;

    try {
      final client = await _authClient();
      final resp = await client.refreshAccessToken(req);
      return resp;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  static Future<void> verifyAccount(
      {@required String id, @required String verificationToken}) async {
    final req = rpc.VerifyAccountRequest()
      ..accountId = id
      ..verifyToken = verificationToken;
    try {
      final client = await _authClient();
      await client.verifyAccount(req);
    } catch (e) {
      throw e;
    }
  }

  static Future<rpc.AuthServiceClient> _authClient() async {
    return rpc.AuthServiceClient(await BaseRepo.grpcWebClientChannel());
  }
}

const _accessTokenKey = "accessToken";
const _refreshTokenKey = "refreshToken";
const _accountIdKey = "accountId";
const _tempAccountIdKey = "tempAccountId";
const _hiveAccountDb = "account";
const _minute = 60; // 60 seconds

Future<CallOptions> getCallOptions() async {
  final prefs = Hive.box('account');
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  var accToken = prefs.get(_accessTokenKey);
  final refreshToken = prefs.get(_refreshTokenKey);
  final currentTime = DateTime.now().toUtc().millisecondsSinceEpoch / 1000;
  if (accToken != null &&
      accToken.isNotEmpty &&
      refreshToken != null &&
      refreshToken.isNotEmpty) {
    final payload = _parseJwtPayLoad(accToken);
    final expiry = payload["exp"];
    if (expiry <= currentTime + _minute) {
      final refreshPayload = _parseJwtPayLoad(refreshToken);
      final refreshExpiry = refreshPayload["exp"];
      if (refreshExpiry <= currentTime + _minute) {
        // refreshtoken expired => log out
        prefs.delete(_accessTokenKey);
        prefs.delete(_refreshTokenKey);
        throw "refresh token expired, logging out";
      }
      try {
        final req = rpc.RefreshAccessTokenRequest()
          ..refreshToken = refreshToken;
        final client =
            rpc.AuthServiceClient(await BaseRepo.grpcWebClientChannel());
        client.refreshAccessToken(req).then((resp) {
          if (resp.hasAccessToken()) {
            prefs.put(_accessTokenKey, resp.accessToken);
          }
        });
      } catch (e) {
        throw e;
      }
    }
    return CallOptions(
      metadata: {"Authorization": "Bearer " + accToken},
    );
  }
  return CallOptions();
}

Map<String, dynamic> _parseJwtPayLoad(String token) {
  final parts = token.split('.');
  if (parts.length != 3) {
    throw Exception('invalid token');
  }

  final payload = _decodeBase64(parts[1]);
  final payloadMap = json.decode(payload);
  if (payloadMap is! Map<String, dynamic>) {
    throw Exception('invalid payload');
  }

  return payloadMap;
}

String _decodeBase64(String str) {
  String output = str.replaceAll('-', '+').replaceAll('_', '/');

  switch (output.length % 4) {
    case 0:
      break;
    case 2:
      output += '==';
      break;
    case 3:
      output += '=';
      break;
    default:
      throw Exception('Illegal base64url string!"');
  }

  return utf8.decode(base64Url.decode(output));
}

void updateTokens({
  @required String accessToken,
  @required String refreshToken,
}) async {
  final prefs = Hive.box(_hiveAccountDb);
  final payload = _parseJwtPayLoad(accessToken);
  final accountId = payload["userId"];
  prefs.put(_accessTokenKey, accessToken);
  prefs.put(_refreshTokenKey, refreshToken);
  prefs.put(_accountIdKey, accountId);
}

bool isLoggedIn() {
  final prefs = Hive.box(_hiveAccountDb);
  final accessToken = prefs.get(_accessTokenKey) ?? '';
  final refreshToken = prefs.get(_refreshTokenKey) ?? '';
  if (accessToken.isNotEmpty && refreshToken.isNotEmpty) {
    return true;
  }
  return false;
}

String getAccountId() {
  final prefs = Hive.box(_hiveAccountDb);
  final accountId = prefs.get(_accountIdKey);
  if (accountId != null && accountId.isNotEmpty) {
    return accountId;
  }
  return "";
}

void insertTempAccountId({@required String tempAccountId}) {
  final prefs = Hive.box('account');
  prefs.put(_tempAccountIdKey, tempAccountId);
}

String getTempAccountId() {
  final prefs = Hive.box('account');
  final accountId = prefs.get(_tempAccountIdKey);
  if (accountId != null && accountId.isNotEmpty) {
    return accountId;
  }
  return "";
}

void logOut() {
  final prefs = Hive.box('account');
  prefs.delete(_accountIdKey);
  prefs.delete(_accessTokenKey);
  prefs.delete(_refreshTokenKey);
}

bool isSuperAdmin() {
  final prefs = Hive.box('account');
  final refreshToken = prefs.get(_refreshTokenKey);
  final roles = _parseJwtPayLoad(refreshToken)['role'] as List<dynamic>;
  var isSuper = false;
  roles.forEach((role) {
    if (role['role'] == rpc.Roles.SUPERADMIN.value) {
      isSuper = true;
    }
  });
  return isSuper;
}

Map<int, rpc.UserRoles> isAdmin() {
  var mapAdminRoles = Map<int, rpc.UserRoles>();
  final prefs = Hive.box('account');
  final refreshToken = prefs.get(_refreshTokenKey);
  final roles = _parseJwtPayLoad(refreshToken)['role'] as List<dynamic>;
  for (var i = 0; i < roles.length; i++) {
    Roles currentRole;
    if (roles[i]['role'] == rpc.Roles.SUPERADMIN.value) {
      currentRole = rpc.Roles.SUPERADMIN;
    } else if (roles[i]['role'] == rpc.Roles.ADMIN.value) {
      currentRole = rpc.Roles.ADMIN;
    } else if (roles[i]['role'] == rpc.Roles.USER.value) {
      currentRole = rpc.Roles.USER;
    } else if (roles[i]['role'] == rpc.Roles.GUEST.value) {
      currentRole = rpc.Roles.GUEST;
    } else if (roles[i]['role'] == rpc.Roles.INVALID.value) {
      currentRole = rpc.Roles.INVALID;
    }
    final rpcRole = UserRoles()..role = currentRole;
    if (roles[i]['projectId'] != null) {
      rpcRole..projectId = roles[i]['projectId'];
    }
    if (roles[i]['orgId'] != null) {
      rpcRole..orgId = roles[i]['orgId'];
    }
    if (rpcRole.role.value == rpc.Roles.ADMIN.value) {
      mapAdminRoles[i] = rpcRole;
    }
  }
  return mapAdminRoles;
}

List<String> getSubscribedOrgs(rpc.Account account) {
  var listSubscribedOrgs = List<String>.empty();
  account.roles.forEach((role) {
    if (role.orgId.isNotEmpty) {
      listSubscribedOrgs.add(role.orgId);
    }
  });
  return listSubscribedOrgs;
}

Map<String, List<String>> getSubscribedProjects(rpc.Account account) {
  var subscribedProjectsMap = Map<String, List<String>>();
  account.roles.forEach((role) {
    if (role.orgId.isNotEmpty) {
      if (subscribedProjectsMap[role.orgId] == null) {
        subscribedProjectsMap[role.orgId] = [role.projectId];
      } else {
        subscribedProjectsMap[role.orgId].add(role.projectId);
      }
    }
  });
  return subscribedProjectsMap;
}
