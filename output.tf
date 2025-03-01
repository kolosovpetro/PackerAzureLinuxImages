output "public_ip" {
  value = module.virtual_machine.public_ip
}

output "username" {
  value = module.virtual_machine.username
}

output "ssh_command" {
  value = "ssh razumovsky_r@${module.virtual_machine.public_ip}"
}
