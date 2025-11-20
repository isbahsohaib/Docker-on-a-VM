# outputs.tf for the compute module, group 9

output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
}

output "admin_username" {
  value = azurerm_linux_virtual_machine.vm.admin_username
}

output "vm_public_ip" {
  value = azurerm_public_ip.pip.ip_address
}

output "vm_private_ip" {
  value = azurerm_network_interface.nic.private_ip_address
}