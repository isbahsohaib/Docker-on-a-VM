# outputs.tf for the main folder, group 9

output "resource_group_name" {
  value = var.resource_group_name
}

output "location" {
  value = var.location
}

output "vm_id" {
  value = module.compute.vm_id
}

output "admin_username" {
  value = module.compute.admin_username
}

output "vm_public_ip" {
  value = module.compute.vm_public_ip
}

output "vm_private_ip" {
  value = module.compute.vm_private_ip
}

output "ssh_command" {
  value = "ssh azureuser@${module.compute.vm_public_ip}"
}
