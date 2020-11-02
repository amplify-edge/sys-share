import 'dart:convert';

HostConfig hostConfigFromJson(String str) =>
    HostConfig.fromJson(json.decode(str));

String hostConfigToJson(HostConfig data) => json.encode(data.toJson());

class HostConfig {
  HostConfig({
    this.baseUri,
    this.flutterChannel,
    this.host,
    this.locales,
    this.port,
    this.url,
    this.urlNative,
  });

  String baseUri;
  String flutterChannel;
  String host;
  List<String> locales;
  String port;
  String url;
  String urlNative;

  factory HostConfig.fromJson(Map<String, dynamic> json) => HostConfig(
        baseUri: json["baseUri"],
        flutterChannel: json["flutter_channel"],
        host: json["host"],
        locales: List<String>.from(json["locales"].map((x) => x)),
        port: json["port"],
        url: json["url"],
        urlNative: json["url_native"],
      );

  Map<String, dynamic> toJson() => {
        "baseUri": baseUri,
        "flutter_channel": flutterChannel,
        "host": host,
        "locales": List<dynamic>.from(locales.map((x) => x)),
        "port": port,
        "url": url,
        "url_native": urlNative,
      };
}
