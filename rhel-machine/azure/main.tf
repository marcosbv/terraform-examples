data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

data "azurerm_subnet" "azure_subnet" {
  name                 = var.azure_subnet
  virtual_network_name = var.azure_vnet
  resource_group_name  = var.resource_group_name
}


resource "azurerm_network_interface" "azure_vm_nic" {
  count               = var.number_of_servers
  name                = "${var.hostname}-${count.index}-vnic"
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = data.azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.azure_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "rhel-machine" {
  count               = var.number_of_servers
  name                = "${var.hostname}-${count.index}"
  resource_group_name = data.azurerm_resource_group.resource_group.name
  location            = data.azurerm_resource_group.resource_group.location
  size                = var.vm_size
  admin_username      = "adminuser"
  network_interface_ids = [
    element(azurerm_network_interface.azure_vm_nic, count.index).id
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file(var.public_key_file_location)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "${var.red_hat_version}-LVM"
    version   = "latest"
  }
}