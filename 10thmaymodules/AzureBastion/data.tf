data "azurerm_subnet" "subnet" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "akkivnet10"
  resource_group_name  = "akkires10"
}