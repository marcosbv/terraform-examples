# Captura ID da VLAN a partir do nome
data "ibm_network_vlan" "private_vlan" {
    name = var.vlan_name
}

# Criação da(s) máquina(s) virtual(is)
resource "ibm_compute_vm_instance" "redhat-machine" {
    count                = var.number_of_servers
    hostname             = "${var.hostname}-${count.index}"
    domain               = var.domain
    os_reference_code    = var.red_hat_version == 8 ? "REDHAT_8_64" : "REDHAT_7_64"
    datacenter           = var.ibmcloud_datacenter
    network_speed        = 10
    hourly_billing       = true
    private_network_only = true
    cores                = var.num_of_cores
    memory               = var.memory
    disks                = var.disks
    local_disk           = false
    private_vlan_id      = data.ibm_network_vlan.private_vlan.id
    
}

# Criação de storage externo (se precisar)
resource "ibm_storage_file" "fs_endurance" {
  count      = var.external_nfs == "true" ? 1 : 0
  type       = "Endurance"
  datacenter = var.ibmcloud_datacenter
  capacity   = var.external_nfs_size
  iops       = var.external_nfs_iops

  # Optional fields
  allowed_virtual_guest_ids = ibm_compute_vm_instance.redhat-machine.*.id
  snapshot_capacity         = 10
  hourly_billing            = true

}