# Packer Azure Ubuntu Image

Packer image for Ubuntu 22.04 in Azure

- Canonical images on Azure: https://documentation.ubuntu.com/azure/en/latest/azure-how-to/instances/find-ubuntu-images/
- List canonical images CLI: `az vm image list -p Canonical --all -o table`

## Installed software V1

- upgrade system packages
- ansible
- ansible azure collection
- docker
- nginx
- prometheus node exporter
- python
- unzip
- zip
- tar
- jo
- htop
- net-tools
- software-properties-common
