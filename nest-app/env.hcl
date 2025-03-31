vault {
  address = "https://vault-iit-test.apps.silver.devops.gov.bc.ca"
  renew_token = true
  vault_agent_token_file = "/config/token/token.txt"
  unwrap_token = true
  retry {
    enabled = true
    attempts = 12
    backoff = "250ms"
    max_backoff = "1m"
  }
}

secret {
    no_prefix = true
    path = "apps/test/spar/spar-war/db_proxy_write_read"
}

exec {
  splay = "0s"
  env {
    pristine = false
  }
  kill_timeout = "5s"
}
