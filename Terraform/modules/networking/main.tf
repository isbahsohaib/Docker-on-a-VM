# main.tf for the networking module, group 9

# --- network ---

# virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.resource_group_name}-vnet"
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.vnet_address_space
}

# subnet
resource "azurerm_subnet" "subnet" {
  name                 = "${var.resource_group_name}-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_prefixes
}

# network security group
resource "azurerm_network_security_group" "nsg" {
  name                = "${var.resource_group_name}-nsg"
  resource_group_name = var.resource_group_name
  location            = var.location

  # nsg rules: allow ssh and http
  dynamic "security_rule" {
    for_each = var.nsg_rules

    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}