resource "azurerm_postgresql_flexible_server" "pgsql" {
  for_each = var.pgsql1
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  version = each.value.version
  location = each.value.location
  public_network_access_enabled = each.value.public_network_access_enabled
  administrator_login = each.value.administrator_login
  administrator_password = each.value.administrator_password
  zone = each.value.zone
  sku_name = each.value.sku_name
  storage_mb = each.value.storage_mb
  storage_tier = each.value.storage_tier
}