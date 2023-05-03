/**
 * These modules will be responsible for creating the necessary structures and configurations to ensure that the namespace is properly set up. This includes defining the permissions and access controls for the namespace. This module should contain predefined input variables, such as:
 * 
 * - Team Name
 * - TFE Project: This should search for an existing TFE project, and if one does not exist, create one.
 * - Metadata: Such as cost code, ownership, etc.
 * 
 * This namespace module will be managed and approved by the Vault Team and will be responsible for:
 * 
 * - Creating the Namespace
 * - Setting up organisational auth requirements
 * - Adding any required policies to the namespace
 * - Adding known entities and groups based on the input variables.
 */
 
resource "vault_namespace" "tenant_namespace" {
  namespace = "admin"
  path = var.name
}

resource "vault_policy" "tentant_policy" {
  name = "${var.name}_admin"
  namespace =  vault_namespace.tenant_namespace.path_fq

  policy = <<EOT
# Manage namespaces
path "sys/namespaces/*" {
   capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage policies
path "sys/policies/acl/*" {
   capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List policies
path "sys/policies/acl" {
   capabilities = ["list"]
}

# Enable and manage secrets engines
path "sys/mounts/*" {
   capabilities = ["create", "read", "update", "delete", "list"]
}

# List available secrets engines
path "sys/mounts" {
  capabilities = [ "read" ]
}

# Create and manage entities and groups
path "identity/*" {
   capabilities = ["create", "read", "update", "delete", "list"]
}

# Manage tokens
path "auth/token/*" {
   capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
EOT
}

resource "vault_identity_group" "tentant_group" {
  name     = "${var.name}_group"
  namespace =  vault_namespace.tenant_namespace.path_fq

  type     = "internal"
  policies = ["${var.name}_admin"]

  metadata = {
    version = "2"
  }
}