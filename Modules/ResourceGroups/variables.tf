variable "rg1" {
  type = map(object({
    name = string
    location = string
  }
  )
  )
 description = "value is passed through tfvars"
}