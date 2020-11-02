import 'package:sys_core/sys_core.dart';
import 'package:sys_share_sys_account_service/sys_share_sys_account_service.dart'
    as rpc;
import 'package:fixnum/fixnum.dart';
import 'package:meta/meta.dart';
import 'package:sys_share_sys_account_service/pkg/shared_repositories/auth_repo.dart';

class UserRepo {
  static Future<rpc.Account> getAccount({@required String id}) async {
    final req = rpc.GetAccountRequest()..id = id;

    try {
      final client = await accountClient();
      final resp =
          client.getAccount(req, options: await getCallOptions()).then((res) {
        return res;
      });
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<rpc.ListAccountsResponse> listAccounts(
      {String currentPageId = '0',
      String orderBy,
      int perPageEntries = 50,
      bool isDescending = false}) async {
    final ppe = Int64(perPageEntries);
    final req = rpc.ListAccountsRequest()
      ..currentPageId = currentPageId
      ..orderBy = orderBy
      ..perPageEntries = ppe;

    try {
      final client = await accountClient();
      final resp =
          client.listAccounts(req, options: await getCallOptions()).then((res) {
        return res;
      });
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<rpc.Account> updateAccount(
      {@required String id,
      bool disabled = false,
      bool verified,
      Map<String, dynamic> userDefinedFields,
      Map<String, dynamic> survey}) async {
    final req = rpc.Account()
      ..id = id
      ..disabled = disabled
      ..verified = verified
      ..fields = rpc.UserDefinedFields.fromJson(userDefinedFields.toString())
      ..survey = rpc.UserDefinedFields.fromJson(userDefinedFields.toString());

    try {
      final client = await accountClient();
      final resp =
          await client.updateAccount(req, options: await getCallOptions());
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<rpc.Account> disableAccount({@required String id}) async {
    final req = rpc.DisableAccountRequest()..accountId = id;
    try {
      final client = await accountClient();
      final resp =
          await client.disableAccount(req, options: await getCallOptions());
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<rpc.Account> assignAccountToRole(
      {@required String assignedAccountId,
      String assigneeAccountId,
      @required rpc.UserRoles role}) async {
    final req = rpc.AssignAccountToRoleRequest()
      ..assignedAccountId = assignedAccountId
      ..assigneeAccountId = assigneeAccountId
      ..role = role;

    try {
      final client = await accountClient();
      final resp = await client.assignAccountToRole(req,
          options: await getCallOptions());
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<rpc.AccountServiceClient> accountClient() async {
    return rpc.AccountServiceClient(await BaseRepo.grpcWebClientChannel());
  }
}
