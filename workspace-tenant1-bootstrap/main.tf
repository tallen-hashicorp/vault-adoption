module "bootstrap" {
  source              = "app.terraform.io/vault-adoption/vault-demo-bootstrap/module"
  version             = "0.0.4"
  name                = var.name
  admin_user_names    = ["neo", "trinity", "morpheus"]
}

variable "name" {
  type      = string
  default   = "tenant_1"
}

terraform {
  cloud {
    organization = "vault-adoption"

    workspaces {
      name = "tenant1-bootstrap"
    }
  }
}