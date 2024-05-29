variable "bastionhost" {
  
}

resource "azurerm_public_ip" "pip" {
  for_each = var.bastionhost
  name                = "publicipchd"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "example" {
  for_each = var.bastionhost
  name                = each.value.bastionname
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.subnet.id
    public_ip_address_id = azurerm_public_ip.pip[each.key].id
  }
}