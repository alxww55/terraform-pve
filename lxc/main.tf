resource "proxmox_lxc" "this" {
  target_node = var.target_node

  vmid         = var.vmid
  hostname     = var.hostname
  clone        = var.clone_template
  full         = var.full_clone
  onboot       = var.on_boot
  start        = var.start
  unprivileged = var.unprivileged

  cores    = var.cpu_cores
  cpulimit = var.cpu_limit
  cpuunits = var.cpu_units

  memory = var.memory
  swap   = var.swap

  rootfs {
    storage = var.storage
    size    = var.disk_size
  }

  dynamic "network" {
    for_each = var.networks

    content {
      name   = network.value.name
      bridge = network.value.bridge
      ip     = network.value.ip
      tag    = try(network.value.tag, null)
      gw     = try(network.value.gw, null)
    }
  }

  hagroup = var.hagroup
  hastate = var.hastate

  features {
    nesting = var.nesting
    keyctl  = var.keyctl
  }

  tags = length(var.tags) > 0 ? join(";", var.tags) : null

  lifecycle {
    prevent_destroy = true

    ignore_changes = [
      tags
    ]
  }
}
