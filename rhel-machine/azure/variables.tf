variable "azure_subscription_id" {

} 

variable "azure_client_id" {
  
}

variable "azure_client_secret" {
  
}

variable "azure_tenant_id" {
  
}

variable "resource_group_name" {
   default = "default"
}

variable "azure_subnet" {

}

variable "azure_vnet" {
  
}

variable "number_of_servers" {
   default = 1
}

variable "hostname" {
  
}

variable "vm_size" {
  
}

variable "red_hat_version" {
   default = 7
}

variable "public_key_file_location" {
   default = "~/.ssh/id_rsa.pub"
}