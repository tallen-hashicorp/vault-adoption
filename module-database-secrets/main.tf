resource "vault_mount" "db" {
  namespace = var.namespace_path

  path = "postgres"
  type = "database"
}

resource "vault_database_secret_backend_connection" "postgres_connection" {
  namespace = var.namespace_path

  backend       = vault_mount.db.path
  name          = "postgres"
  allowed_roles = ["postgres-admin"]

  postgresql {
    connection_url  = "postgres://{{username}}:{{password}}@${var.db_host}:5432/${var.db_name}"
    username        = var.db_username
    password        = var.db_password
  }
}

resource "vault_database_secret_backend_role" "postgres_admin_role" {
  namespace = var.namespace_path
  
  backend             = vault_mount.db.path
  name                = "postgres-admin"
  db_name             = vault_database_secret_backend_connection.postgres_connection.name
  creation_statements = ["CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}'; GRANT SELECT ON ALL TABLES IN SCHEMA public TO \"{{name}}\";"]
  default_ttl         = 3600 //1 hour
}