variable "name" {
  description = "Team or Tenant name"
  type = string
}

variable "admin_user_names" {
  description = "Create Vault users and entities with these names"
  type        = list(string)
}