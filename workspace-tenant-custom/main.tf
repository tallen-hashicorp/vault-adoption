module "bootstrap" {
  source          = "app.terraform.io/vault-adoption/vault-demo-database/module"
  version         = "0.0.2"
  db_host         = "database-1.c9rxkaf43me4.us-east-1.rds.amazonaws.com"
  db_password     = "xNKBBVDP"
  name            = "tenant_1"
  namespace_path  = "admin/tenant_1"
}

terraform {
  cloud {
    organization = "vault-adoption"

    workspaces {
      name = "tenant1-custom"
    }
  }
}