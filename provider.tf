terraform {
  cloud {
    organization = "djoo-hashicorp"
    workspaces {
      name = "tf-vault-config"
    }
  }
}

provider "aws" {
  region = var.region
}

provider "tfe" {}

provider "vault" {
}

provider "hcp" {
  project_id = "prj-YpGLTbLarHAuspt3"
}