output "machine_ips" {
    value = azurerm_network_interface.azure_vm_nic.*.private_ip_address
}

output "machine_names" {
    value = azurerm_linux_virtual_machine.rhel-machine.*.computer_name
}
