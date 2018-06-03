variable "resource_group" {
  description = "myResourceGroup"
}

variable "location" {
  description = "The location/region where the virtual network resides."
  default     =  "westeurope"
}

variable "hostname" {
  description = "myterraforvm"
}

variable "existing_storage_acct" {
  description = "myrepos"
}

## Create NIC ##
variable "existing_network_security_group" {
  default     = "Rancher"
}

variable "existing_subnet_id" {
  description = "default"
}

## Create storage account for boot diagnostics ##
variable "storage_account_tier" {
  description = "Defines the Tier of storage account to be created. Valid options are Standard and Premium."
  default     = "Standard"
}

variable "storage_replication_type" {
  description = "Defines the Replication Type to use for this storage account. Valid options include LRS, GRS etc."
  default     = "LRS"
}


## Create virtual machine ##
variable "vm_size" {
  description = "Specifies the size of the virtual machine."
  default     = "Standard_B1ms"
}

variable "os_disk_vhd_uri" {
  description = "https://XXX/system/Microsoft.Compute/Images/rancher/Packer_Docker_K8s-osDisk.4213faa2-6f7f-4223-8555-581eea57275c.vhd"
}

variable "vhd_uri" {
  description = "Container name"
}
variable "existing_vnet_resource_group" {
  description = "Name of the existing resource group in which the existing vnet resides"
}

variable "os_type" {
  description = "Type of OS on the existing vhd. Allowed values: 'windows' or 'linux'."
  default     = "linux"
}

variable "admin_username" {
  default     = "matthieu"
}

variable "ssh_keys_path" {
  default     = "/home/matthieu/.ssh/authorized_keys"
}

variable "ssh_keys_key_data" {
  default     = "XXX"
}

## By default ##

#Image
variable "image_publisher" {
  description = "name of the publisher of the image (az vm image list)"
  default     = "Canonical"
}

variable "image_offer" {
  description = "the name of the offer (az vm image list)"
  default     = "UbuntuServer"
}

variable "image_sku" {
  description = "image sku to apply (az vm image list)"
  default     = "16.04-LTS"
}

variable "image_version" {
  default     = "latest"
}

#Network
variable "existing_virtual_network_name" {
  description = "myResourceGroup-vnet"
}

variable "existing_subnet_name" {
  description = "default"
}

variable "address_space" {
  default     = "10.1.0.0/24"
}

variable "subnet_prefix" {
  default     = "10.1.0.0/24"
}
