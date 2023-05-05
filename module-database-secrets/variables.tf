variable "namespace_path" {
  description = "Vault Namespace Path"
  type = string
}

variable "db_name" {
  description = "Database Name"
  type = string
}

variable "db_host" {
  description = "Database Host"
  type = string
}

variable "db_username" {
  description = "Database Admin Name - this is for demo purposes only"
  type = string
  default = "postgres"
}

variable "db_password" {
  description = "Database Admin Password - this is for demo purposes only"
  type = string
}