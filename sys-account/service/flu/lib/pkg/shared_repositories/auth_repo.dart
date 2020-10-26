import 'package:sys_core/pkg/shared_repositories/base_repo.dart';
import 'package:sys_share_sys_account_service/sys_share_sys_account_service.dart'
    as rpc;
import 'package:meta/meta.dart';

class AuthRepo extends BaseRepo {
  static final client = _authClient();

  static Future<rpc.LoginResponse> loginUser(
      {@required String email, @required String password}) async {
    final req = rpc.LoginRequest()
      ..email = email
      ..password = password;

    try {
      final resp = await client.login(req).then((res) {
        print(res);
        return res;
      });
      await updateTokens(
        accessToken: resp.accessToken,
        refreshToken: resp.refreshToken,
      );
      return resp;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  static Future<rpc.RegisterResponse> registerAccount(
      {@required String email,
      @required String password,
      @required String passwordConfirm}) async {
    if (password != passwordConfirm) {
      rpc.RegisterResponse resp = rpc.RegisterResponse.getDefault()
        ..success = false
        ..errorReason = rpc.ErrorReason()
        ..errorReason.reason = "password mismatch";
      return resp;
    }

    try {
      final request = rpc.RegisterRequest()
        ..email = email
        ..password = password
        ..passwordConfirm = passwordConfirm;
      final resp = await client.register(request);
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<rpc.ForgotPasswordResponse> forgotPassword(
      {@required String email}) async {
    final req = rpc.ForgotPasswordRequest()..email = email;
    try {
      return await client.forgotPassword(req);
    } catch (e) {
      throw e;
    }
  }

  static Future<rpc.ResetPasswordResponse> resetPassword(
      {@required String email,
      @required String password,
      @required String passwordConfirm}) async {
    final req = rpc.ResetPasswordRequest()
      ..email = email
      ..password = password
      ..passwordConfirm = passwordConfirm;

    try {
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
      await client.verifyAccount(req);
    } catch (e) {
      throw e;
    }
  }

  static rpc.AuthServiceClient _authClient() {
    return rpc.AuthServiceClient(BaseRepo.channel);
  }
}
