# Terraform Module for Azure Management Groups
Management group module is used to create management group and add subscriptions under management group.

```hcl
module "management-group" {
    source           = "SudharsaneSivamany/modules//modules/management-group/azurerm"
    management_group = [{    parent           = null # if group has to be created under tenant root group
                             name             = "group1"
                             subscription_ids = ["subs_id_1, subs_id_2"]}] 
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.34.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.34.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_management_group.level_1_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) | resource |
| [azurerm_management_group.level_2_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) | resource |
| [azurerm_management_group.level_3_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) | resource |
| [azurerm_management_group.level_4_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) | resource |
| [azurerm_management_group.level_5_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) | resource |
| [azurerm_management_group.level_6_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_management_group"></a> [management\_group](#input\_management\_group) | List of Object for Management group creation | <pre>list(object({<br>    parent           = optional(string, null)<br>    name             = string<br>    subscription_ids = optional(list(string), [])<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_management-groups"></a> [management-groups](#output\_management-groups) | n/a |
