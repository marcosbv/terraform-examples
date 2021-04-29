output "machine_ips" {
    value = ibm_compute_vm_instance.redhat-machine.*.ipv4_address_private
}

output "machine_names" {
    value = ibm_compute_vm_instance.redhat-machine.*.hostname
}

output "storage_volume_names" {
    value = ibm_storage_file.fs_endurance.*.volumename
}

output "storage_mount_points" {
    value = ibm_storage_file.fs_endurance.*.mountpoint
}