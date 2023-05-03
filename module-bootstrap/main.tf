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