data "azurerm_subnet" "subnet" {
  name                 = "Frontend"
  virtual_network_name = "akkivnet10"
  resource_group_name  = "akkires10"
}
data "azurerm_key_vault" "username" {
  name                = "username"
  resource_group_name = "akkires10"
}
data "azurerm_key_vault" "password" {
  name                = "password"
  resource_group_name = "akkires10"
}