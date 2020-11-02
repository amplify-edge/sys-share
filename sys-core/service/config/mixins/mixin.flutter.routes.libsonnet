local prefix = "MOD_SOMETHING";
function(prefixName = prefix, host = "HOST", port = "PORT") {
    server: {
        host: std.extVar(prefixName + "_" + host),
        port: std.extVar(prefixName + "_" + port),
    }
}