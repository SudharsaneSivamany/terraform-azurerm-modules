locals {
  output_substitution = flatten([
    [for entry in local.level_1_group : { "${entry.name}" = azurerm_management_group.level_1_group[entry.name].id }],
    [for entry in local.level_2_group : { "${entry.name}" = azurerm_management_group.level_2_group[entry.name].id }],
    [for entry in local.level_3_group : { "${entry.name}" = azurerm_management_group.level_3_group[entry.name].id }],
    [for entry in local.level_4_group : { "${entry.name}" = azurerm_management_group.level_4_group[entry.name].id }],
    [for entry in local.level_5_group : { "${entry.name}" = azurerm_management_group.level_5_group[entry.name].id }],
    [for entry in local.level_6_group : { "${entry.name}" = azurerm_management_group.level_6_group[entry.name].id }]
  ])
}

output "management-groups" {
  value = { for entry in local.output_substitution : keys(entry)[0] => values(entry)[0] }
}