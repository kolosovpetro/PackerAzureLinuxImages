# Packer Azure Ubuntu Image

This repository contains a Packer template to build a custom Ubuntu Server image for Microsoft Azure VMs.

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
- jq
- htop
- net-tools
- software-properties-common

### Build image (Run from the folder where `versions.hcl` file located)

- Setup required environment variables
- .\Packer-Init-Validate.ps1
- .\Packer-Build.ps1 -PackerImage ".\templates\azure-ubuntu-packer.pkr.hcl" -VarFile ".\packer.ubuntu2204.osds.vars.json"
- .\Packer-Build.ps1 -PackerImage ".\templates\azure-ubuntu-packer.pkr.hcl" -VarFile ".\packer.ubuntu2204.pkolosov.vars.json"

### Test Image

- `terraform init`
- `terraform plan`
- `terraform apply`
