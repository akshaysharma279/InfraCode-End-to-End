variable "res" {}
module "res1" {
  source = "../../Resourcegroup"
  res    = var.res
}

variable "vnet" {}
module "vnet1" {
  source = "../../Virtualnetwork"
  vnet=var.vnet
  depends_on = [module.res1]
}
variable "subnet" {}
module "sub1" {
  source = "../../Subnet"
  subnet=var.subnet
  depends_on = [module.vnet1]
  
}
variable "bastionhost" {}
module "bas1" {
  source = "../../AzureBastion"
  bastionhost=var.bastionhost
  depends_on = [module.sub1]
  
}
variable "key" {}
module "ke" {
  source = "../../Keyvault"
  key=var.key
  depends_on = [ module.res1 ]
  
}
variable "VM" {}
module "vm" {
  source = "../../Virtualmachine"
  VM=var.VM
  depends_on = [ module.ke]
  
}
