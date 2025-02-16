# Packer Azure Image Builder

This repository contains a Packer template to build a custom Ubuntu Server image for Microsoft Azure VMs.

## Prerequisites

- Packer installed (https://developer.hashicorp.com/packer/downloads)
- Azure CLI installed and authenticated (`az login`)
- Service principal with necessary permissions

## Setup & Build

### Authenticate to Azure

- az login
- az account set --subscription <subscription-id>

### Build image (Run from the folder where `versions.hcl` file located)

- Setup required environment variables
- .\Packer-Init-Validate.ps1
- .\Packer-Build.ps1 -PackerImage ".\templates\azure-ubuntu-packer.pkr.hcl" -VarFile ".\packer.ubuntu2204.osds.vars.json"
- .\Packer-Build.ps1 -PackerImage ".\templates\azure-ubuntu-packer.pkr.hcl" -VarFile ".\packer.ubuntu2204.pkolosov.vars.json"
- .\Packer-Build.ps1 -PackerImage ".\templates\azure-ubuntu-packer.v2.pkr.hcl" -VarFile ".\packer.ubuntu2204.osds.vars.v2.json"
- .\Packer-Build.ps1 -PackerImage ".\templates\azure-ubuntu-packer.v2.pkr.hcl" -VarFile ".\packer.ubuntu2204.pkolosov.vars.v2.json"

### Test Image

- `terraform init`
- `terraform plan`
- `terraform apply`
