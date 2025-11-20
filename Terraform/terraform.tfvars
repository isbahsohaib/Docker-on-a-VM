# terraform.tfvars for the main folder, group 9

# resource group and location
resource_group_name = "RG-NSSA-320-Group9"
location            = "eastus"

# virtual machine configuration
vm_name = "vm-nssa-320-group9"
vm_size = "Standard_B2s"

# nsg rules
nsg_rules = [
  {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  {
    name                       = "HTTP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
]