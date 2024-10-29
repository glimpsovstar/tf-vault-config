variable "org_name" {
  type    = string
  default = "djoo-hashicorp"
}
variable "vault_workspace_name" {
  type    = string
  default = "tf-vault-cluster"
}

variable "workspace_name" {
  type    = string
  default = "tf-vault-config"
}

variable "db_username" {
  type = string
  default = "djoo"
}

variable "db_password" {
  type = string
  default = "Demo1234"
}

variable "region" {
  type = string
  default = "ap-southeast-2"
}

variable "db_name" {
  description = "Unique name to assign to RDS instance"
  default = "djoo-demo-db"
}