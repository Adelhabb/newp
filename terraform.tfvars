# Configuration du fournisseur Proxmox
provider "proxmox" {
  pm_api_url      = "https://192.168.217.128:8006/"
  pm_user         = "root"
  pm_password     = "adminprox"
  pm_tls_insecure = true
}

# Création de la machine virtuelle
resource "proxmox_vm_qemu" "ubuntu_vm" {
  name            = "ubuntu-vm"
  clone           = "template"
  target_node     = "your-proxmox-node"
  target_storage  = "your-proxmox-storage"
  full_clone      = true

  network {
    model  = "virtio"
    bridge = "your-bridge-name"
  }

  disk {
    id      = 0
    storage = "your-proxmox-storage"
    size    = "10G" # Ajustez la taille du disque selon vos besoins
  }

  os_type = "ubuntu" # Ajustez le type de système d'exploitation selon votre template
}
