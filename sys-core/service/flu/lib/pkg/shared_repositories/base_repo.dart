import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;
import 'package:grpc/grpc_web.dart';
import 'package:grpc/grpc.dart';
import 'package:sys_core/pkg/config/host_config.dart';

class BaseRepo {
  static final String hostConfigPath =
      "assets/env.json";
  static final Map<String, String> callMetadata = {
    "Content-Type": "application/grpc-web",
  };

  static Future<HostConfig> getHostConfig() async {
    final hcs = await rootBundle.loadString(BaseRepo.hostConfigPath);
    return HostConfig.fromJson(json.decode(hcs));
  }

  static Future<GrpcWebClientChannel> grpcWebClientChannel() async {
    final hc = await getHostConfig();
    print("HOST: ${hc.host}, PORT: ${hc.port}");
    return GrpcWebClientChannel.xhr(
        Uri(scheme: "https", host: hc.host, port: int.parse(hc.port)));
  }

  static Future<ClientChannel> grpcClientChannel() async {
    final hc = await getHostConfig();
    return ClientChannel(hc.host, port: int.parse(hc.port));
  }
}
