import 'package:sys_core/sys_core.dart';
import 'package:sys_share_sys_account_service/sys_share_sys_account_service.dart'
    as rpc;
import 'package:fixnum/fixnum.dart';

class UserRepo {
  // TODO @winwisely268: this is ugly, ideally we want flu side interceptor
  // as well so each request will have authorization metadata.
  static Future<rpc.Account> getUser({String id}) async {
    final req = rpc.GetAccountRequest()..id = id;

    try {
      final resp = await accountClient()
          .getAccount(req, options: await getCallOptions())
          .then((res) {
        return res;
      });
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<rpc.ListAccountsResponse> listUser(
      {String currentPageId, String orderBy, int perPageEntries}) async {
    final ppe = Int64(perPageEntries);
    final req = rpc.ListAccountsRequest()
      ..currentPageId = currentPageId
      ..orderBy = orderBy
      ..perPageEntries = ppe;

    try {
      final resp = await accountClient()
          .listAccounts(req, options: await getCallOptions())
          .then((res) {
        return res;
      });
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static rpc.AccountServiceClient accountClient() {
    return rpc.AccountServiceClient(BaseRepo.channel);
  }
}
