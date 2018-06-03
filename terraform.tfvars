resource_group = "myResourceGroup"
location =  "westeurope"
hostname = "myterraforvm"
existing_storage_acct = "myrepos"


## Create NIC ##
existing_network_security_group = "/subscriptions/75f087ab-6d74-487a-b450-ae8b96558762/resourceGroups/myResourceGroup/providers/Microsoft.Network/networkSecurityGroups/Rancher"
existing_subnet_id = "/subscriptions/75f087ab-6d74-487a-b450-ae8b96558762/resourceGroups/myResourceGroup/providers/Microsoft.Network/virtualNetworks/myResourceGroup-vnet/subnets/default"

## Create storage account for boot diagnostics ##
storage_account_tier = "Standard"
storage_replication_type = "LRS"

## Create virtual machine ##
vm_size = "Standard_B1ms"
os_disk_vhd_uri = "https://myrepos.blob.core.windows.net/system/Microsoft.Compute/Images/rancher/Packer_Docker_K8s-osDisk.4213faa2-6f7f-4223-8555-581eea57275c.vhd"
vhd_uri = "myrepos.blob.core.windows.net/images"
existing_vnet_resource_group = "myResourceGroup-vnet"
os_type = "linux"
admin_username = "matthieu"
ssh_keys_path = "/home/matthieu/.ssh/authorized_keys"
ssh_keys_key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwyZsyvFjfTNZWtAZ6JOXvv8yz+yn7be5dOt4ao8AHZN9Xhqrv/1gt/vR1ZD2i/b2MFfYO79Uk6FuGttnnNyvY/5cyGfSbvFylGCEk08W0VtSpME1Cbl9X54M4ZJnDxcv+GZ01UUc+J5i5UF+FNHEcuDvYHNX2mv0Hs8TceNKCs1zBlQfNgrS7/qfUPTg0/cl2f2gsn/xxH+JtTaRCo056CHjKluxyvi2pEjUpx/9gMfDOZZm9KHHXENtYw9jrOMY0WiwDxNFhMeeqCsrGX6z+o6eBcdfYg2JS2ZjmUqx4dQ22cuxXGBHinPlxsz/aAUBvK00LYivToZrkZnnQtSo7 Matthieu@MacBook-Pro-de-Matthieu.local"

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

