module "resourcegroups" {
  source = "../../Modules/ResourceGroups"
  rg1    = var.rg1
}

module "Virtualnetwork" {
  source = "../../Modules/Virtual network"
  depends_on = [ module.resourcegroups ]
  vnet1 = var.vnet1
  vmm = var.vmm
  vms = var.vms
}

module "subnets" {
  source = "../../Modules/Subnet"
  subnet = var.subnet
  depends_on = [ module.Virtualnetwork ]
}

module "pgssql" {
  source = "../../Modules/Database"
  depends_on = [ module.resourcegroups ]
  pgsql1 = var.pgsql1
}

module "pip" {
  source = "../../Modules/Public-IPs"
  depends_on = [ module.resourcegroups ]
  pip = var.pip
}

module "vms" {
  source = "../../Modules/Compute"
  depends_on = [ module.subnets, module.pip ]
  vms = var.vms
  vmm = var.vmm
}

