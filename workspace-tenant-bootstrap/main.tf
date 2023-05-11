module "bootstrap" {
  source              = "app.terraform.io/vault-adoption/vault-demo-bootstrap/module"
  version             = "0.0.4"
  name                = "tenant_1"
  admin_user_names    = ["neo", "trinity", "morpheus"]
}

terraform {
  cloud {
    organization = "vault-adoption"

    workspaces {
      name = "tenant1-bootstrap"
    }
  }
}