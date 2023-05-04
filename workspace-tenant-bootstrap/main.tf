module "bootstrap" {
  source        = "../module-bootstrap"
  name          = "tenant_1"
  admin_user_names    = ["neo", "trinity", "morpheus"]
}

