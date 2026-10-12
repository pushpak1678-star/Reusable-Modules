
data "azurerm_subnet" "this" {
  for_each = var.vms
  name = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_subnet" "thos" {
  for_each = var.vmm
  name = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_public_ip" "this" {
  for_each = var.vms
  name = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}


resource "azurerm_network_interface" "this" {
  for_each = var.vms
  name = "${each.value.name}-nic"
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
    name = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_id = data.azurerm_subnet.this[each.key].id
    public_ip_address_id = data.azurerm_public_ip.this[each.key].id
  }
}


resource "azurerm_linux_virtual_machine" "vms" {
  for_each = var.vms
  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  size = each.value.size
  admin_username = each.value.admin_username
  admin_password = each.value.admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.this[each.key].id,
  ]
  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer = "ubuntu-24_04-lts"
    sku = "server"
    version = "latest"
  }
}

resource "azurerm_network_interface" "thas" {
  for_each = var.vmm
  name = "${each.value.name}-nic"
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
    name = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_id = data.azurerm_subnet.thos[each.key].id
  }
}

resource "azurerm_linux_virtual_machine" "vmm" {
  for_each = var.vmm
  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  size = each.value.size
  admin_username = each.value.admin_username
  admin_password = each.value.admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.thas[each.key].id,
  ]
  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer = "ubuntu-24_04-lts"
    sku = "server"
    version = "latest"
  }
}