# Configuration using all possible parameters

module "application" {
  source = "github.com/alxww55/terraform-pve/lxc"

  target_node = "cloud-01"

  vmid           = 101
  hostname       = "app-dev-01"
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
  disk_size = "32G"

  networks = [
    {
      name   = "eth0"
      hwaddr = null
      bridge = "vmbr0"
      ip     = "15.161.33.111/8"
      tag    = null
      gw     = "15.151.33.1"
    },
    {
      name   = "eth10"
      hwaddr = null
      bridge = "vmbr10"
      ip     = "dhcp"
      tag    = 10
      gw     = null
    },
    {
      name   = "eth20"
      hwaddr = null
      bridge = "vmbr20"
      ip     = "dhcp"
      tag    = 20
      gw     = null
    }
  ]

  hagroup = null
  hastate = null

  nesting = true
  keyctl  = false

  tags = [
    "dev",
    "application",
    "database"
  ]
}
