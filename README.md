# Terraform module for Proxmox VE LXC
Terraform module for provisioning and managing LXC in Proxmox VE

![Proxmox](https://img.shields.io/badge/Proxmox-VE-orange)
![Terraform](https://img.shields.io/badge/Terraform-1.4+-purple)
![GitHub License](https://img.shields.io/github/license/alxww55/shorty)

## Features
- Creating and managing LXC in Proxmox VE
- Multiple network interfaces support
- Fine-grained configuration with features support

## Requirements
- Terraform >= 1.4
- Proxmox VE >= 8
- [Telmate/proxmox](https://registry.terraform.io/providers/Telmate/proxmox/latest) provider for Proxmox

## Known Limitations
1. Changes to `tags` are ignored intentionally.
2. Lifecycle rule `prevent_destroy` is enabled by default to protect infrastructure.
3. Automatic container start after creation is currently not supported.

## Usage
```hcl
module "lxc" {
  source = "github.com/alxww55/terraform-pve/lxc"

  target_node = "value"

  vmid           = 111
  hostname       = "dev-srv-01"
  clone_template = "ubuntu-2404-lts"
  full_clone     = true
  on_boot        = true
  start          = true
  unprivileged   = true

  cpu_cores = 4
  cpu_limit = 0
  cpu_units = 100

  memory = 8192
  swap   = 1024

  storage   = "local-lvm"
  disk_size = "16G"

  networks = [
    {
      name   = "eth0"
      hwaddr = null
      bridge = "vmbr0"
      ip     = "10.168.33.111/24"
      tag    = null
      gw     = "10.168.33.1"
    },
    {
      name   = "eth10"
      hwaddr = null
      bridge = "vmbr10"
      ip     = "dhcp"
      tag    = 10
      gw     = null
    }
  ]

  hagroup = null
  hastate = null

  nesting = true
  keyctl  = false

  tags = [
    "dev",
    "automation"
  ]
}
```
## Project Status
Contributions are welcome!

Feel free to:
- Open issues for bugs or suggestions
- Submit pull requests with improvements
- Contact me directly to discuss collaboration

Contributors will be recognized in project credits.
## Author
Created by [alxww55](https://github.com/alxww55)
