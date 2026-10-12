resource "azurerm_resource_group" "resourcegroups"{
    for_each = var.rg1
  name = each.value.name
  location = each.value.location
}