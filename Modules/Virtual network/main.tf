resource "azurerm_virtual_network" "Vnet" {
  for_each = var.vnet1
  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space = each.value.address_space
}

data "azurerm_virtual_network" "central" {
  for_each = var.vms
  name = each.value.virtual_network_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_virtual_network" "south" {
  for_each = var.vmm
  name = each.value.virtual_network_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_virtual_network_peering" "central2south" {
  name                      = "central-to-south"
  resource_group_name       = data.azurerm_virtual_network.central["vm1"].resource_group_name
  virtual_network_name      = data.azurerm_virtual_network.central["vm1"].name
  remote_virtual_network_id = data.azurerm_virtual_network.south["vm3"].id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}


resource "azurerm_virtual_network_peering" "south2central" {
  name                      = "south-to-central"
  resource_group_name       = data.azurerm_virtual_network.south["vm3"].resource_group_name
  virtual_network_name      = data.azurerm_virtual_network.south["vm3"].name
  remote_virtual_network_id = data.azurerm_virtual_network.central["vm1"].id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}
