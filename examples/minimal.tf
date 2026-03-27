# Minimal configuration

module "minimal" {
  source = "github.com/alxww55/terraform-pve/lxc"

  target_node = "pve01"

  vmid           = 100
  hostname       = "example"
  clone_template = "ubuntu-2404-lts"

  networks = [{
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }]
}
