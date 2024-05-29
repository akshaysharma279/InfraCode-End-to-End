res = {
  re = {
    name     = "akkires10"
    location = "westeurope"
  }
}
vnet={
    vn={
        vnetname                = "akkivnet10"
  address_space       = ["10.0.0.0/16"]
location            = "westeurope"
  resource_group_name = "akkires10"
    }
}
subnet={
    sub1={
        subname                 = "frontend"
  resource_group_name  = "akkires10"
  virtual_network_name ="akkivnet10"
  address_prefixes     = ["10.0.1.0/24"]
    }
    sub2={
        subname                 = "AzureBastionSubnet"
  resource_group_name  = "akkires10"
  virtual_network_name ="akkivnet10"
  address_prefixes     = ["10.0.2.0/24"]
    }
}
bastionhost={
    bastion={
        resource_group_name  = "akkires10"
        location = "westeurope"
    bastionname="akkibastion10"
    }
}
key={
    k={
        keyname="kuberkakhazana"
     location = "westeurope"
        resource_group_name  = "akkires10"
    }
}

VM={
    v={
    nicname = "akkinic10"
    location             = "westeurope"
    virtual_network_name = "akkivnet10"
    resource_group_name  = "akkires10"
    ipname               = "akkiip10"
    vmname               = "Iamowner27"
    storagedisk="myosdisk11"
}
    }


