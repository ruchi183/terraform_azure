variable "azure_subscription_id" {}
variable "azure_client_id" {}
variable "azure_client_secret" {}
variable "azure_tenant_id" {}
variable "location" {
    description = "location for VNet and VM"
    default = "east us"
}

variable "address_space" {
    description = "address space for VNET"
    default = "10.0.0.0/24"
}

variable "subnet_id"{
    description = "subnet ID"
}

variable "vm_size"{
    description = "VM Size"
    type = "list"
}

variable "vm_password"{
    description = "Password for local user of windows admin account"
    default = "xxxxxx"
}

variable storage_account{
    description = "storage account for VM hard-disk"
    type = "list"
}

variable "vnet_name" {
    description = "Vnet Name"
    type = "list"
}

variable "subnet_name"{
    description = "Subnet names"
    type = "list"
}

variable "vm_name"{
    description = "virtual machine name/Hostname"
    type = "list"
}

variable "private_ip"{
    description = "virtual machine private IP"
    type = "list"
}

#workspace key of log analytics 
variable "omskey"{
    default = "xxxxx"
}
