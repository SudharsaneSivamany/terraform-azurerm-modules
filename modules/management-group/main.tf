locals {
  level_1_group     = [for entry in var.management_group : entry if entry.parent == null]
  remove_root_group = setsubtract(var.management_group, local.level_1_group)
  level_2_group     = [for entry in local.remove_root_group : entry if contains(local.level_1_group[*].name, entry.parent)]
  level_3_group     = [for entry in local.remove_root_group : entry if contains(local.level_2_group[*].name, entry.parent)]
  level_4_group     = [for entry in local.remove_root_group : entry if contains(local.level_3_group[*].name, entry.parent)]
  level_5_group     = [for entry in local.remove_root_group : entry if contains(local.level_4_group[*].name, entry.parent)]
  level_6_group     = [for entry in local.remove_root_group : entry if contains(local.level_5_group[*].name, entry.parent)]
}

#1 level group
resource "azurerm_management_group" "level_1_group" {
  for_each         = { for entry in local.level_1_group : entry.name => entry }
  name             = each.key
  subscription_ids = each.value.subscription_ids
}

#2 level group
resource "azurerm_management_group" "level_2_group" {
  for_each                   = { for entry in local.level_2_group : entry.name => entry }
  parent_management_group_id = azurerm_management_group.level_1_group[each.value.parent].id
  name                       = each.key
  subscription_ids           = each.value.subscription_ids
}

#3 level group
resource "azurerm_management_group" "level_3_group" {
  for_each                   = { for entry in local.level_3_group : entry.name => entry }
  parent_management_group_id = azurerm_management_group.level_2_group[each.value.parent].id
  name                       = each.key
  subscription_ids           = each.value.subscription_ids
}

#4 level group
resource "azurerm_management_group" "level_4_group" {
  for_each                   = { for entry in local.level_4_group : entry.name => entry }
  parent_management_group_id = azurerm_management_group.level_3_group[each.value.parent].id
  name                       = each.key
  subscription_ids           = each.value.subscription_ids
}

#5 level group
resource "azurerm_management_group" "level_5_group" {
  for_each                   = { for entry in local.level_5_group : entry.name => entry }
  parent_management_group_id = azurerm_management_group.level_4_group[each.value.parent].id
  name                       = each.key
  subscription_ids           = each.value.subscription_ids
}

#6 level group
resource "azurerm_management_group" "level_6_group" {
  for_each                   = { for entry in local.level_6_group : entry.name => entry }
  parent_management_group_id = azurerm_management_group.level_5_group[each.value.parent].id
  name                       = each.key
  subscription_ids           = each.value.subscription_ids
}