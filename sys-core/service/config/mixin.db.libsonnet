{
    local cfg = self,
    DB:: {
        name: "some.db",
        encryptKey: "somekey!@",
        rotationDuration: 1,
        dbDir: "./db",
    },
    Cron:: {
        backupSchedule: "@daily",
        rotateSchedule: "@every 24h",
        backupDir: cfg.DB.dbDir + "/backup"
    },
    db: cfg.DB,
    cron: cfg.Cron,
}