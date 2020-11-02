local loadVar = import "../config/mixins/mixin.flutter.routes.libsonnet";

local cfg = {
    HostCfg:: loadVar(prefixName="SYS_CORE", host="HOST", port="PORT"),
    host: self.HostCfg.server.host,
    port: self.HostCfg.server.port,
    baseUri: "getcouragenow.org",
    url: "maintemplate.ci" + "." + self.baseUri,
    url_native: "grpc.maintemplate.ci" + "." + self.baseUri,
    flutter_channel: "beta",
    locales: [
        "en",
		"es",
		"de",
		"fr",
		"it",
		"ur"
    ]
};

std.manifestJson(cfg)
