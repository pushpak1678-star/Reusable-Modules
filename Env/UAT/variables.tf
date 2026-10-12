variable "rg1" {
  type = map(object({
    name = string
    location = string
  }
  )
  )
 description = "value is passed through tfvars"
}


variable "vnet1" {
  type = map(any)
}

variable "subnet" {
  type = map(any)
}

variable "pgsql1" {
  type = map(any)
}

variable "vms" {
  type = map(any)
}

variable "pip" {
  type = map(any)
}
variable "vmm" {
  type = map(any)
}