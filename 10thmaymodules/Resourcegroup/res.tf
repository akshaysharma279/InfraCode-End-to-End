variable "res"{}

resource "azurerm_resource_group" "res1" {
    for_each = var.res
  name =each.value.name
  location=each.value.location
}