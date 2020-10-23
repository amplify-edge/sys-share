{
    local cfg = self,
    Token:: {
        secret: "some_secrets_are_meant_to_be_kept_in_the_open",
        expiry: 3600,
    },
    token: self.Token,
}
