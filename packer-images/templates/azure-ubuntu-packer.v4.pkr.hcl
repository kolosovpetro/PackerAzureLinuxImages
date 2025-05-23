variable "azure-client-id" {
  type = string
  default = env("PACKER_MPN_SUB_CLIENT_ID")
}

variable "azure-client-secret" {
  type = string
  default = env("PACKER_MPN_SUB_CLIENT_SECRET")
}

variable "azure-subscription-id" {
  type = string
  default = env("PACKER_MPN_SUB_ID")
}

variable "azure-tenant-id" {
  type = string
  default = env("PACKER_MPN_SUB_TENANT_ID")
}

variable "azure-region" {
  type    = string
  default = "northeurope"
}

variable "azure-resource-group" {
  type    = string
  default = "rg-packer-images-linux"
}

variable "vm-size" {
  type    = string
  default = "Standard_D4s_v3"
}

variable "image-name" {
  type    = string
  default = "ubuntu2204-v1"
}

variable "image-sku" {
  type    = string
  default = "22_04-lts-gen2"
}

source "azure-arm" "autogenerated_1" {
  client_id                         = var.azure-client-id
  client_secret                     = var.azure-client-secret
  image_offer                       = "0001-com-ubuntu-server-jammy"
  image_publisher                   = "canonical"
  image_sku                         = var.image-sku
  location                          = var.azure-region
  managed_image_name                = var.image-name
  managed_image_resource_group_name = var.azure-resource-group
  os_type                           = "Linux"
  subscription_id                   = var.azure-subscription-id
  tenant_id                         = var.azure-tenant-id
  vm_size                           = var.vm-size
}

build {
  sources = ["source.azure-arm.autogenerated_1"]

  provisioner "shell" {
    scripts = [
      "./scripts/Upgrade-System-Packages.sh",
      "./scripts/Install-Nginx.sh",
      "./scripts/Install-Python.sh",
      "./scripts/Install-Certbot.sh",
      "./scripts/Install-Ansible.sh",
      "./scripts/Install-Dev-Essential-Software.sh",
      "./scripts/Install-Docker.sh",
      "./scripts/Install-Linux-Prometheus-Server.sh",
      "./scripts/Install-Kubectl-Kubeadm-Kubelet.sh",
      "./scripts/Install-Grafana.sh",
      "./scripts/Install-Stress-Ng.sh",
      "./scripts/Install-Fio.sh",
      "./scripts/Validate-Image-Integrity.sh",
      "./scripts/Execute-Sysprep.sh"
    ]
    execute_command = "chmod +x {{ .Path }} && {{ .Vars }} {{ .Path }}"
  }
}
