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
| [vault_identity_group.tentant_group](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group) | resource |
| [vault_namespace.tenant_namespace](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/namespace) | resource |
| [vault_policy.tentant_policy](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |

## Outputs

No outputs.