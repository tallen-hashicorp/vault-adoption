These modules will be responsible for creating the necessary structures and configurations to ensure that the namespace is properly set up. This includes defining the permissions and access controls for the namespace. This module should contain predefined input variables, such as:

- Team Name
- TFE Project: This should search for an existing TFE project, and if one does not exist, create one.
- Metadata: Such as cost code, ownership, etc.

This namespace module will be managed and approved by the Vault Team and will be responsible for:

- Creating the Namespace
- Setting up organisational auth requirements
- Adding any required policies to the namespace
- Adding known entities and groups based on the input variables.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~> 3.15.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | ~> 3.15.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_auth_backend.userpass](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/auth_backend) | resource |
| [vault_generic_endpoint.u1](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_endpoint) | resource |
| [vault_identity_entity.tenant_entitys](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_entity) | resource |
| [vault_identity_entity_alias.tenant_alias](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_entity_alias) | resource |
| [vault_identity_group.tenant_group](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group) | resource |
| [vault_namespace.tenant_namespace](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/namespace) | resource |
| [vault_policy.tentant_admin_policy](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_user_names"></a> [admin\_user\_names](#input\_admin\_user\_names) | Create Vault users and entities with these names | `list(string)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Team or Tenant name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tenant_group_policy_id"></a> [tenant\_group\_policy\_id](#output\_tenant\_group\_policy\_id) | n/a |
| <a name="output_tenant_namespace_path"></a> [tenant\_namespace\_path](#output\_tenant\_namespace\_path) | n/a |