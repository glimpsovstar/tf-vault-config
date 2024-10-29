resource "vault_policy" "admin_policy" {
  name   = "admins"
  policy = file("policies/admin-policy.hcl")
}

resource "vault_policy" "dev_policy" {
  name   = "dev"
  policy = file("policies/dev-policy.hcl")
}

resource "vault_policy" "kv-admin_policy" {
  name   = "kv-admin"
  policy = file("policies/kv-admin-policy.hcl")
}

