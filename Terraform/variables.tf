# variables.tf for the main folder, group 9

variable "resource_group_name" {
  description = "name of the resource group"
  type        = string
}

variable "location" {
  description = "region of the resources"
  type        = string
}

variable "vm_name" {
  description = "name of the virtual machine"
  type        = string
}

variable "vm_size" {
  description = "size of the virtual machine"
  type        = string
}

variable "nsg_rules" {
  description = "list of the nsg rules"
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}
