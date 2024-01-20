resource "azurerm_resource_group" "az-rg" {
  name     = "azure-infra"
  location = "eastus"
}

resource "azurerm_user_assigned_identity" "az-uai" {
  location            = azurerm_resource_group.az-rg.location
  name                = "az-bootstrap"
  resource_group_name = azurerm_resource_group.az-rg.name
}

resource "azurerm_federated_identity_credential" "az-fic" {
  name                = "az-bootstrap-cred"
  resource_group_name = azurerm_resource_group.az-rg.name
  audience            = ["api://AzureADTokenExchange"]
  issuer              = "https://token.actions.githubiusercontent.com"
  parent_id           = azurerm_user_assigned_identity.az-uai.id
  subject             = "repo:SudharsaneSivamany/azure-infra:ref:refs/heads/main"
}

data "azurerm_subscription" "primary" {
  # subscription_id = "51154fd6-0bef-499f-af79-fb26c3314751"
}

resource "azurerm_role_assignment" "example" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.az-uai.principal_id
}

provider "azurerm" {
  features {}
}