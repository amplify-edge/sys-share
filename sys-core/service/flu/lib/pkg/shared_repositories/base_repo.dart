import 'package:grpc/grpc_web.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _accessTokenKey = "accessToken";
const _refreshTokenKey = "refreshToken";
const _accountIdKey = "accountId";

class BaseRepo {
  static final channel = _grpcWebClientChannel();
  static final Map<String, String> callMetadata = {
    "Content-Type": "application/grpc-web",
  };

  static GrpcWebClientChannel _grpcWebClientChannel() {
    return GrpcWebClientChannel.xhr(Uri(host: "127.0.0.1", port: 9074));
  }
}

Future<CallOptions> getCallOptions() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final accToken = prefs.getString(_accessTokenKey);
  if (accToken != null && accToken.isNotEmpty) {
    return CallOptions(metadata: {"Authorization": "Bearer " + accToken});
  }
  return CallOptions();
}

Future<void> updateTokens(
    {@required String accessToken,
    @required String refreshToken,
    @required String accountId}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(_accessTokenKey, accessToken);
  await prefs.setString(_refreshTokenKey, refreshToken);
  await prefs.setString(_accountIdKey, accountId);
}

Future<bool> isLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final accessToken = prefs.getString(_accessTokenKey);
  final refreshToken = prefs.getString(_refreshTokenKey);
  if (accessToken != null &&
      accessToken.isNotEmpty &&
      refreshToken != null &&
      refreshToken.isNotEmpty) {
    return true;
  }
  return false;
}
