variable "public_ip_name" {
  type        = string
  description = "Name of the public IP"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet"
}

variable "network_interface_name" {
  type        = string
  description = "Name of the network interface"
}

variable "ip_configuration_name" {
  type        = string
  description = "Name of the IP configuration"
}

variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
}

variable "vm_size" {
  type        = string
  description = "The size of the virtual machine."
}

variable "storage_os_disk_name" {
  type        = string
  description = "The name of the OS disk."
}

variable "storage_os_disk_caching" {
  type        = string
  description = "Specifies the caching requirements for the OS disk."
}

variable "storage_os_disk_create_option" {
  type        = string
  description = "Specifies how the virtual machine should be created."
}

variable "storage_os_disk_managed_disk_type" {
  type        = string
  description = "Specifies the storage account type for the managed disk."
}

variable "os_profile_computer_name" {
  type        = string
  description = "Specifies the host OS name of the virtual machine."
}

variable "os_profile_admin_username" {
  type        = string
  description = "Specifies the name of the administrator account."
}

variable "os_profile_admin_public_key" {
  type        = string
  description = "Specifies the path to the public key file."
}

variable "custom_image_sku" {
  type        = string
  description = "The ID of the custom image to be used for virtual machine deployment."
}

variable "custom_image_resource_group_name" {
  type        = string
  description = "The name of the resource group where the custom image is stored."
}

variable "network_security_group_id" {
  type        = string
  description = "The ID of the network security group (NSG) to be associated with the network interface. Defaults to an empty string if not provided."
}

