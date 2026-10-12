rg1 = {
  "resource1" = {
    name     = "test1"
    location = "East US"
  }
}

vnet1 = {
  "vnet1.1" = {
  "name" = "test1-vnet"
  "location" = "Central India"
  "resource_group_name" = "test1"
  "address_space" = ["10.0.0.0/16"]    
  }
  "vnet1.2" = {
  "name" = "test2-vnet"
  "location" = "South India"
  "resource_group_name" = "test1"
  "address_space" = ["10.1.0.0/16"]    
  }
}

subnet = {  
  "sub1" = {
    "name" = "testsub1"
    "resource_group_name" = "test1"
    "virtual_network_name" = "test1-vnet"
    "address_prefixes" = ["10.0.1.0/24"]

  }
  "sub2" = {
    "name" = "testsub2"
    "resource_group_name" = "test1"
    "virtual_network_name" = "test1-vnet"
    "address_prefixes" = ["10.0.2.0/24"]

  }
 "sub3" = {
    "name" = "testsub3"
    "resource_group_name" = "test1"
    "virtual_network_name" = "test2-vnet"
    "address_prefixes" = ["10.1.1.0/24"]

  }
}

pgsql1 = {
  "pgsql1_1" = {
    "name" = "mypgsql678"
    "resource_group_name" = "test1"
    "version" = "18"
    "location" = "Canada Central"
    "public_network_access_enabled" = "true"
    "administrator_login" = "**********"
    "administrator_password" = "************"  
    "zone" = "1"
    "sku_name" = "B_Standard_B1ms"
    "storage_mb" = "32768"
    "storage_tier" = "P4"
  }
}

pip = {
  "pip1" = {
    "name" = "pip1"
    "location" = "Central India"
    "resource_group_name" = "test1"
    "allocation_method" = "Static"
    }
  "pip2" = {
    "name" = "pip2"
    "location" = "Central India"
    "resource_group_name" = "test1"
    "allocation_method" = "Static"
  }
}


vms = {
  "vm1" = {
    "name" = "vm1"
    "location" = "Central India"
    "resource_group_name" = "test1"
    "size" = "Standard_B2ts_v2"
    "admin_username" = "************"
    "admin_password" = "**************"
    "subnet_name" = "testsub1"
    "public_ip_name" = "pip1"
    "virtual_network_name" = "test1-vnet"
  }
   "vm2" = {
    "name" = "vm2"
    "location" = "Central India"
    "resource_group_name" = "test1"
    "size" = "Standard_B2ts_v2"
    "admin_username" = "***********"
    "admin_password" = "***********"
    "subnet_name" = "testsub2"
    "public_ip_name" = "pip2"
    "virtual_network_name" = "test1-vnet"
  }
}

vmm = {
  "vm3" = {
    "name" = "VMMonitoring"
    "location" = "South India"
    "resource_group_name" = "test1"
    "size" = "Standard_B2ts_v2"
    "admin_username" = "*************"
    "admin_password" = "**************"
    "subnet_name" = "testsub3"
    "virtual_network_name" = "test2-vnet"
  }
}


