# Packer Azure Ubuntu Image

This repository contains a Packer template to build a custom Ubuntu Server image for Microsoft Azure VMs.

- Canonical images on Azure: https://documentation.ubuntu.com/azure/en/latest/azure-how-to/instances/find-ubuntu-images/
- List canonical images CLI: `az vm image list -p Canonical --all -o table`

## Example of use

```hcl
module "virtual_machine" {
    source                            = "git::git@github.com:kolosovpetro/PackerAzureLinuxImages.git//modules/vm"
    resource_group_location           = azurerm_resource_group.public.location
    resource_group_name               = azurerm_resource_group.public.name
    ip_configuration_name             = "ipc-ubuntu-${var.prefix}"
    network_interface_name            = "nic-ubuntu-${var.prefix}"
    os_profile_admin_username         = "razumovsky_r"
    os_profile_admin_public_key = file("${path.root}/id_rsa.pub")
    os_profile_computer_name          = "vm-ubuntu-${var.prefix}"
    public_ip_name                    = "pip-ubuntu-${var.prefix}"
    storage_os_disk_caching           = var.storage_os_disk_caching
    storage_os_disk_create_option     = var.storage_os_disk_create_option
    storage_os_disk_managed_disk_type = var.storage_os_disk_managed_disk_type
    storage_os_disk_name              = "osdisk-ubuntu-${var.prefix}"
    subnet_id                         = azurerm_subnet.internal.id
    vm_name                           = "vm-ubuntu-${var.prefix}"
    vm_size                           = var.vm_size
    custom_image_sku                  = "ubuntu2204-v1"
    custom_image_resource_group_name  = "rg-packer-images-linux"
    network_security_group_id         = azurerm_network_security_group.public.id
}
```

## Installed software V1

- ./scripts/Upgrade-System-Packages.sh
- ./scripts/Install-Python.sh
- ./scripts/Install-Nginx.sh
- ./scripts/Install-Certbot.sh
- ./scripts/Install-Ansible.sh
- ./scripts/Install-Ansible-Azure-Collection.sh
- ./scripts/Install-Dev-Essential-Software.sh
- ./scripts/Install-Docker.sh
- ./scripts/Install-Linux-Prometheus-Node-Exporter.sh
- ./scripts/Validate-Image-Integrity.sh
- ./scripts/Execute-Sysprep.sh

## Installed software V2

- ./scripts/Upgrade-System-Packages.sh
- ./scripts/Install-Python.sh
- ./scripts/Install-Certbot.sh
- ./scripts/Install-Ansible.sh
- ./scripts/Install-Dev-Essential-Software.sh
- ./scripts/Install-Docker.sh
- ./scripts/Install-Kubectl-Kubeadm-Kubelet.sh
- ./scripts/Install-Linux-Prometheus-Node-Exporter.sh
- ./scripts/Validate-Image-Integrity.sh
- ./scripts/Execute-Sysprep.sh

## Installed software V3

- ./scripts/Upgrade-System-Packages.sh
- ./scripts/Install-Nginx.sh
- ./scripts/Install-Python.sh
- ./scripts/Install-Certbot.sh
- ./scripts/Install-Ansible.sh
- ./scripts/Install-Dev-Essential-Software.sh
- ./scripts/Install-Docker.sh
- ./scripts/Install-Linux-Prometheus-Server.sh
- ./scripts/Install-Install-Grafana.sh
- ./scripts/Validate-Image-Integrity.sh
- ./scripts/Execute-Sysprep.sh

## Installed software V4

- ./scripts/Upgrade-System-Packages.sh
- ./scripts/Install-Nginx.sh
- ./scripts/Install-Python.sh
- ./scripts/Install-Certbot.sh
- ./scripts/Install-Ansible.sh
- ./scripts/Install-Dev-Essential-Software.sh
- ./scripts/Install-Docker.sh
- ./scripts/Install-Linux-Prometheus-Server.sh
- ./scripts/Install-Kubectl-Kubeadm-Kubelet.sh
- ./scripts/Install-Grafana.sh
- ./scripts/Install-Stress-Ng.sh
- ./scripts/Install-Fio.sh
- ./scripts/Validate-Image-Integrity.sh
- ./scripts/Execute-Sysprep.sh

