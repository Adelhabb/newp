resource "proxmox_vm_qemu" "ubuntu_vm" {
  name            = "exemple"
  clone           = var.clone_template
  target_node     = var.target_node
  target_storage  = 20480
  full_clone      = true
  network {
    model   = "virtio"
    bridge  = var.bridge
  }
  disk {
    id       = 0
    storage  = var.target_storage
    size     = var.disk_size
  }
  os_type = var.os_type
}
variable "pm_api_url" {}
variable "pm_user" {}
variable "pm_password" {}
variable "clone_template" {}
variable "target_node" {}
variable "target_storage" {}
variable "bridge" {}
variable "disk_size" {}
variable "os_type" {}
