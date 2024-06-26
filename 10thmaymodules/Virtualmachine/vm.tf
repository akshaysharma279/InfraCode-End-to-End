variable "VM"{}

resource "azurerm_network_interface" "nicard" {

  for_each=var.VM
  name                = each.value.nicname
  location            = each.value.location
  resource_group_name = each.value.resource_group_name 

  ip_configuration {
  
    name                          = each.value.ipname
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  
  }
}
resource "azurerm_virtual_machine" "vmmachine" {
  for_each = var.VM
  name                  = each.value.vmname
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  network_interface_ids = [azurerm_network_interface.nicard[each.key].id]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
 
    name              = each.value.storagedisk
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = data.azurerm_key_vault.username.id
    admin_password = data.azurerm_key_vault.password.id
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}
