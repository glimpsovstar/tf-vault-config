### Create a namespace
#resource "vault_namespace" "djoo-demo" {
#  path = "djoo-demo"
#}

### Create a KVv2 Secrets Engine
resource "vault_mount" "kv-demo" {
#  namespace  = vault_namespace.djoo-demo.path
  path        = "kv-demo"
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
}

resource "vault_kv_secret_backend_v2" "kv-demo-back" {
#  namespace  = vault_namespace.djoo-demo.path
  mount                = vault_mount.kv-demo.path
  max_versions         = 100
  #delete_version_after = 12600
  cas_required         = true
}

### Entries for the KVv2 Secrets Engine
resource "vault_kv_secret_v2" "prod" {
#  namespace  = vault_namespace.djoo-demo.path
  mount = vault_mount.kv-demo.path
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
#  namespace  = vault_namespace.djoo-demo.path
  mount = vault_mount.kv-demo.path
  name = "dev"
  cas = 1
  data_json = jsonencode (
        {
            username = "d-admin",
            password = "d^password"
        }
    )
}


