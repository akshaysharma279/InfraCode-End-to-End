variable "vnet" {
}
resource "azurerm_virtual_network" "VN" {
  for_each = var.vnet
  name                = each.value.vnetname
  address_space       = each.value.address_space
location            = each.value.location
  resource_group_name = each.value.resource_group_name
}
