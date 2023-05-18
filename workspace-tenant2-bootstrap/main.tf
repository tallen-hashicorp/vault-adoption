module "bootstrap" {
  source              = "app.terraform.io/vault-adoption/vault-demo-bootstrap/module"
  version             = "0.0.4"
  name                = var.name
  admin_user_names    = ["tyler"]
}

variable "name" {
  type      = string
  default   = "tenant_2"
}

terraform {
  cloud {
    organization = "vault-adoption"

    workspaces {
      name = "tenant2-bootstrap"
    }
  }
}