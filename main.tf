provider "proxmox" {
  pm_api_url       = var.pm_api_url
  pm_user          = var.pm_user
  pm_password      = var.pm_password
  pm_tls_insecure  = true
}
resource "proxmox_vm_qemu" "ubuntu_vm" {
  name          = "ubuntu-vm"
  clone         = "template"  # Clone from a template
  target_node   = var.target_node
  target_storage = var.target_storage
  full_clone    = true

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
