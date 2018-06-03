 provider "azurerm" {
   subscription_id = "75f087ab-6d74-487a-b450-ae8b96558762"
   client_id       = "e751bfb3-0d62-424b-b879-688465daff37"
   client_secret   = "48ce0539-1ddc-4efa-81d9-ccfddc4307c1"
   tenant_id       = "a1299414-ffb5-4f7e-91bb-d630aee37f87"
 }

resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group}"
  location = "${var.location}"
}

resource "azurerm_public_ip" "pip" {
  name                         = "TerraformPublicIP"
  location                     = "${var.location}"
  resource_group_name          = "${azurerm_resource_group.rg.name}"
  public_ip_address_allocation = "Dynamic"
  domain_name_label            = "${var.hostname}"
}

# Create NIC
resource "azurerm_network_interface" "nic" {
  name                		= "nic"
  location            		= "${var.location}"
  resource_group_name 		= "${azurerm_resource_group.rg.name}"
  network_security_group_id = "${var.existing_network_security_group}"

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = "${var.existing_subnet_id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.pip.id}"
  }
}

# Generate random text for a unique storage account name
resource "random_id" "randomId" {
    keepers = {
        # Generate a new ID only when a new resource group is defined
        resource_group = "${azurerm_resource_group.rg.name}"
    }

    byte_length = 8
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "mystorageaccount" {
  name                     = "diag${random_id.randomId.hex}"
  resource_group_name      = "${azurerm_resource_group.rg.name}"
  location                 = "${var.location}"
  account_tier             = "${var.storage_account_tier}"
  account_replication_type = "${var.storage_replication_type}"
}

# Create virtual machine
resource "azurerm_virtual_machine" "vm" {
  name                  = "${var.hostname}"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.rg.name}"
  vm_size               = "${var.vm_size}"
  network_interface_ids = ["${azurerm_network_interface.nic.id}"]

  storage_os_disk {
    name          = "${var.hostname}osdisk1"
    image_uri     = "${var.os_disk_vhd_uri}"
    vhd_uri       = "https://${var.vhd_uri}/${var.hostname}osdisk.vhd",
    os_type       = "${var.os_type}"
    caching       = "ReadWrite"
    create_option = "FromImage"
  }

  os_profile {
    computer_name  = "${var.hostname}"
    admin_username = "${var.admin_username}"
  }

  os_profile_linux_config {
	disable_password_authentication = true
        ssh_keys {
            path     = "${var.ssh_keys_path}"
            key_data = "${var.ssh_keys_key_data}"
        }
    }
  

}
