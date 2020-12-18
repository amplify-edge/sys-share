import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sys_core/pkg/i18n/languages.dart';

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
    this.githash,
    this.releaseChannel,
  });

  String baseUri;
  String flutterChannel;
  String host;
  List<Locale> locales;
  String port;
  String url;
  String urlNative;
  String githash;
  String releaseChannel;

  factory HostConfig.fromJson(Map<String, dynamic> json) => HostConfig(
        baseUri: json["baseUri"],
        flutterChannel: json["flutter_channel"],
        host: json["host"],
        port: json["port"],
        url: json["url"],
        urlNative: json["url_native"],
        locales: _buildLocalesFromList(json["locales"]),
        githash: json['githash'],
        releaseChannel: json['releaseChannel'],
      );

  factory HostConfig.fromJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return HostConfig.fromJson(json);
  }

  factory HostConfig.empty() => HostConfig(
        baseUri: "",
        flutterChannel: "",
        host: "",
        locales: [],
        port: "",
        url: "",
        urlNative: "",
        githash: "",
        releaseChannel: "",
      );

  Map<String, dynamic> toJson() => {
        "baseUri": baseUri,
        "flutter_channel": flutterChannel,
        "host": host,
        "locales": List<dynamic>.from(locales.map((x) => x)),
        "port": port,
        "url": url,
        "url_native": urlNative,
        "githash": githash,
        "releaseChannel": releaseChannel,
      };

  /// Accepts a Map from the jsonDecode() and puts its values in a list.
  /// Note: If the list is empty, we will return the default list
  static List<Locale> _buildLocalesFromList(List<dynamic> _locales) {
    List<Locale> locales = _locales.map((value) => Locale(value)).toList();

    return locales.isEmpty ? Languages.getLocales() : locales;
  }
}
