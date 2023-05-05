module "database_secret" {
  source          = "../module-database-secrets"
  namespace_path  = var.namespace_path
  db_name         = postgresql_database.database.name
  db_host         = var.db_host
  db_username     = postgresql_role.admin_user.name
  db_password     = random_password.password.result
}

resource "random_password" "password" {
  length           = 16
  special          = false
}

resource "postgresql_database" "database" {
  name  = var.name
  owner = postgresql_role.admin_user.name
}

resource "postgresql_schema" "my_schema" {
  name      = var.name
  database  = postgresql_database.database.name
  owner     = postgresql_role.admin_user.name
}

resource "postgresql_role" "admin_user" {
  name        = "${var.name}_admin"
  password    = random_password.password.result

  create_role = true
  login       = true

  roles       = ["rds_superuser"] 
}

resource "postgresql_grant" "read_insert_column" {
  database          = postgresql_database.database.name
  role              = postgresql_role.admin_user.name
  object_type       = "database"
  privileges        = ["ALL"]
  with_grant_option = true
}