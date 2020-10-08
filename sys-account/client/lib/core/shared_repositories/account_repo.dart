import 'package:sys_share_sys_account_service/sys_share_sys_account_service.dart'
    as rpc;
import 'package:grpc/grpc_web.dart';

class UserRepo {
  // TODO @winwisely268: this is ugly, ideally we want flu side interceptor
  // as well so each request will have authorization metadata.
  static Future<rpc.Account> getUser({String id, String accessToken}) async {
    final req = rpc.GetAccountRequest()..id = id;

    try {
      final resp = await accountClient(accessToken)
          .getAccount(req,
              options: CallOptions(metadata: {"Authorization": accessToken}))
          .then((res) {
        return res;
      });
      return resp;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  static rpc.AccountServiceClient accountClient(String accessToken) {
    final channel =
        GrpcWebClientChannel.xhr(Uri(host: "127.0.0.1", port: 8888));
    return rpc.AccountServiceClient(channel);
  }
}
