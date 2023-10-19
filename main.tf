data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "public" {
  location = var.resource_group_location
  name     = "rg-packer-ubuntu-${var.prefix}"
}

module "network" {
  source                  = "./modules/network"
  resource_group_location = azurerm_resource_group.public.location
  resource_group_name     = azurerm_resource_group.public.name
  subnet_name             = "vm-ubuntu-subnet-${var.prefix}"
  vnet_name               = "vm-ubuntu-vnet-${var.prefix}"

  depends_on = [
    azurerm_resource_group.public
  ]
}

module "virtual_machine" {
  source                            = "./modules/vm"
  ip_configuration_name             = "vm-ubuntu-ip-config-${var.prefix}"
  network_interface_name            = "vm-ubuntu-nic-${var.prefix}"
  os_profile_admin_username         = var.os_profile_admin_username
  os_profile_admin_public_key_path  = var.os_profile_admin_public_key_path
  os_profile_computer_name          = "vm-ubuntu-${var.prefix}"
  public_ip_name                    = "vm-ubuntu-ip-${var.prefix}"
  resource_group_location           = azurerm_resource_group.public.location
  resource_group_name               = azurerm_resource_group.public.name
  storage_image_reference_offer     = var.storage_image_reference_offer
  image_resource_group_name         = var.image_resource_group_name
  storage_image_reference_publisher = var.storage_image_reference_publisher
  storage_image_reference_sku       = var.storage_image_reference_sku
  storage_image_reference_version   = var.storage_image_reference_version
  storage_os_disk_caching           = var.storage_os_disk_caching
  storage_os_disk_create_option     = var.storage_os_disk_create_option
  storage_os_disk_managed_disk_type = var.storage_os_disk_managed_disk_type
  storage_os_disk_name              = "vm-ubuntu-os-disk-${var.prefix}"
  subnet_id                         = module.network.subnet_id
  vm_name                           = "vm-ubuntu-${var.prefix}"
  vm_size                           = var.vm_size
  nsg_name                          = "vm-ubuntu-nsg-${var.prefix}"

  depends_on = [
    module.network,
    azurerm_resource_group.public
  ]
}
