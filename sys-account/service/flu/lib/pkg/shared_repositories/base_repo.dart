import 'package:grpc/grpc_web.dart';

class BaseRepo {
  static final channel = _grpcWebClientChannel();
  static final Map<String, String> callMetadata = {
    "Content-Type": "application/grpc-web",
  };

  static GrpcWebClientChannel _grpcWebClientChannel() {
    return GrpcWebClientChannel.xhr(Uri(host: "127.0.0.1", port: 9074));
  }
}
