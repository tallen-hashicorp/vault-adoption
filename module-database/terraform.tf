terraform {
  required_providers {
    postgresql = {
      source = "cyrilgdn/postgresql"
      version = "~> 1.19.0"
    }
  }
}

provider "postgresql" {
  host            = var.db_host
  port            = 5432
  username        = var.db_username
  password        = var.db_password
  connect_timeout = 15
  superuser       = false
}