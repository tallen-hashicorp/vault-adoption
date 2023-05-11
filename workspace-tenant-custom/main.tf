
module "bootstrap" {
  source          = "app.terraform.io/vault-adoption/vault-demo-database/module"
  version         = "0.0.6"
  db_host         = "database-1.c9rxkaf43me4.us-east-1.rds.amazonaws.com"
  db_password     = "xNKBBVDP"
  name            = "tenant_1"
  namespace_path  = "admin/tenant_1"
  group_id        = data.tfe_outputs.bootstrap.values.tenant_group_policy_id
}

terraform {
  cloud {
    organization = "vault-adoption"

    workspaces {
      name = "tenant1-custom"
    }
  }
}

data "tfe_outputs" "bootstrap" {
  organization = "vault-adoption"
  workspace = "tenant1-bootstrap"
}
