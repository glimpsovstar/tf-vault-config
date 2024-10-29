### VAULT AUTH CONFIG ###
resource "vault_auth_backend" "userpass" {
  type = "userpass"
}

resource "vault_generic_endpoint" "jean" {
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/jean"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": ["dev"],
  "password": "changeme"
}
EOT
}

resource "vault_generic_endpoint" "djoo" {
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/djoo"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": ["kv-admin"],
  "password": "changeme"
}
EOT
}
