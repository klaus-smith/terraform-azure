resource_group = "myResourceGroup"
location =  "westeurope"
hostname = "myterraforvm"
existing_storage_acct = "myrepos"


## Create NIC ##
existing_network_security_group = "/subscriptions/XXX/resourceGroups/myResourceGroup/providers/Microsoft.Network/networkSecurityGroups/Rancher"
existing_subnet_id = "/subscriptions/XXX/resourceGroups/myResourceGroup/providers/Microsoft.Network/virtualNetworks/myResourceGroup-vnet/subnets/default"

## Create storage account for boot diagnostics ##
storage_account_tier = "Standard"
storage_replication_type = "LRS"

## Create virtual machine ##
vm_size = "Standard_B1ms"
os_disk_vhd_uri = "https://XXX/system/Microsoft.Compute/Images/rancher/Packer_Docker_K8s-osDisk.4213faa2-6f7f-4223-8555-581eea57275c.vhd"
vhd_uri = "myrepos.blob.core.windows.net/images"
existing_vnet_resource_group = "myResourceGroup-vnet"
os_type = "linux"
admin_username = "matthieu"
ssh_keys_path = "/home/matthieu/.ssh/authorized_keys"
ssh_keys_key_data = "XXX"

## By default ##
#Image
image_publisher = "Canonical"
image_offer = "UbuntuServer"
image_sku = "16.04-LTS"
image_version = "latest"


#Network
existing_virtual_network_name = "myResourceGroup-vnet"
existing_subnet_name = "default"
address_space = "10.1.0.0/24"
subnet_prefix = "10.1.0.0/24"

