variable "prefix" {
  type        = string
  description = "Resources name prefix"
  default     = "d01"
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group."
  default     = "northeurope"
}

variable "vm_size" {
  type        = string
  description = "The size of the virtual machine."
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
