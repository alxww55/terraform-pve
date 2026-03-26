variable "target_node" {
  type        = string
  description = "Proxmox node where the LXC will run"
}

variable "vmid" {
  type        = number
  description = "Unique ID of the LXC container"
}

variable "hostname" {
  type        = string
  description = "Hostname of the container"
}

variable "clone_template" {
  type        = string
  description = "Name of the LXC template used for cloning"
}

variable "full_clone" {
  type        = bool
  description = "Create full clone instead of linked clone"
}

variable "on_boot" {
  type        = bool
  description = "Start container automatically on node boot"
  default     = true
}

variable "start" {
  type        = bool
  description = "Start container after creation"
  default     = true
}

variable "unprivileged" {
  type        = bool
  description = "Run container as unprivileged"
  default     = false
}

variable "cpu_cores" {
  type        = number
  description = "Number of CPU cores"
  default     = 1
}

variable "cpu_limit" {
  type        = number
  description = "CPU limit per core (0 = unlimited)"
  default     = 0
}

variable "cpu_units" {
  type        = number
  description = "CPU priority weight"
  default     = 100
}

variable "memory" {
  type        = number
  description = "RAM size in MiB"
  default     = 1024
}

variable "swap" {
  type        = number
  description = "Swap size in MiB"
  default     = 1024
}

variable "storage" {
  type        = string
  description = "Proxmox storage where disk will be created"
  default     = "local-lvm"
}

variable "disk_size" {
  type        = string
  description = "Disk size (example: 16G)"
  default     = "16G"
}

variable "networks" {
  description = "List of network interfaces"

  type = list(object({
    name   = string
    bridge = string
    ip     = string
    tag    = optional(number)
    gw     = optional(string)
    hwaddr = optional(string)
  }))
}

variable "hagroup" {
  type        = string
  description = "HA group name"
  default     = null
}

variable "hastate" {
  type        = string
  description = "HA state (started, stopped, ignored)"
  default     = null
}

variable "nesting" {
  type        = bool
  description = "Enable nesting (needed for Docker inside LXC)"
  default     = true
}

variable "keyctl" {
  type        = bool
  description = "Enable keyctl support"
  default     = false
}

variable "tags" {
  type        = list(string)
  description = "List of Proxmox tags for the container"
  default     = []
}
