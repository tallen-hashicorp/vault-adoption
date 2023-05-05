output "tenant_namespace_path" {
  value = vault_namespace.tenant_namespace.path_fq
}

output "tenant_group_policy_id" {
  value = vault_identity_group.tenant_group.id
}