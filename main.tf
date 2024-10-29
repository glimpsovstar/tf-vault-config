### Create a namespace
resource "vault_namespace" "djoo-demo" {
  path = "djoo-demo"
}

### Create a KVv2 Secrets Engine
resource "vault_secret_backend_v2" "kv-demo" {
  path = "djoo-demo/kv-demo"
  type = "kv-v2"
  description = "Demo KVv2 Secrets Engine"
}

### Entries for the KVv2 Secrets Engine
resource "vault_kv_secret_v2" "prod" {
  mount = vault_secret_backend.kv-demo.path
  name = "prod"
  cas = 1
  data_json = jsonencode (
        {
            username = "p-admin",
            password = "p*password"
        }
    )
}

resource "vault_kv_secret_v2" "dev" {
  mount = vault_secret_backend.kv-demo.path
  name = "dev"
  cas = 1
  data_json = jsonencode (
        {
            username = "d-admin",
            password = "d^password"
        }
    )
}


