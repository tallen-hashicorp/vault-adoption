module "bootstrap" {
  source        = "../module-database"
  db_host       = "database-1.c9rxkaf43me4.us-east-1.rds.amazonaws.com"
  db_password   = "xNKBBVDP"
  name          = "tenant_1"
}

