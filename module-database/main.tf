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
  password    = var.db_password

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