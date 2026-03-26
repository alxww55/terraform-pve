output "vmid" {
  description = "ID of the LXC"
  value       = proxmox_lxc.this.vmid
}

output "hostname" {
  description = "Hostname of the LXC"
  value       = proxmox_lxc.this.hostname
}

output "ip" {
  description = "IP address of the first network LXC is connected to"
  value       = proxmox_lxc.this.network[0].ip
}
