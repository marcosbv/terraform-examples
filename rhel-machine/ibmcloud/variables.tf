######################################
# Provider connection properties
######################################
variable "iaas_classic_username" {
    type = string
    description = "Nome do usuário na infra estrutura clássica"
}

variable "iaas_classic_api_key" {
    type = string
    description = "API Key do usuário na infra estrutura clássica"
}

######################################
# Data source properties 
######################################
variable "vlan_name" {
    type = string
    description = "Nome da VLAN privada para anexar essa máquina"
}

######################################
# Common properties
######################################
variable "ibmcloud_datacenter" {
    type = string
    default = "sao01"
    description = "Datacenter onde a máquina virtual será criada"
}

#######################################
# Storage resource properties
#######################################
variable "external_nfs" {
    type = string
    description = "Criar e montar um File Storage a essas máquinas (true/false)"
    default = "false"
}

variable "external_nfs_size" {
    type = number
    description = "Tamanho do File Storage externo a criar (se external_nfs true)"
    default = 20
}

variable "external_nfs_iops" {
    type = number
    description = "IOPS do File Storage externo a criar (se external_nfs true)"
    default = 0.25
}
 
#######################################
# Virtual machine properties
######################################
variable "number_of_servers" {
    type = number
    description = "Número de servidores a criar"
    default = 1
} 

variable "domain" {
    type = string
    description = "Domínio do servidor (fará parte do FQDN do host)"
}

variable "hostname" {
    type = string
    default = "vm"
    description = "Nome do host a ser criado"
}

variable "red_hat_version" {
    type = number
    default = 7
    description = "Versão do RedHat a ser instalada"
}

variable "num_of_cores" {
    type = number
    default = 1
    description = "Número de cores virtuais"
}

variable "memory" {
    type = number
    default = 1024
    description = "Memória RAM da máquina virtual"
}

variable "disks" {
    type = list
    default = [25]
    description = "Lista dos tamanhos de discos a serem criados"
}