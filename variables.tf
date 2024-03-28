# Déclaration des variables
variable "pm_api_url" {
  description = "URL de l'API Proxmox"
}

variable "pm_user" {
  description = "Nom d'utilisateur pour l'authentification Proxmox"
}

variable "pm_password" {
  description = "Mot de passe pour l'authentification Proxmox"
}

variable "target_node" {
  description = "Nom du nœud Proxmox"
}

variable "target_storage" {
  description = "Nom du stockage Proxmox"
}

variable "bridge" {
  description = "Nom du pont réseau"
}

variable "disk_size" {
  description = "Taille du disque pour la VM"
}

variable "os_type" {
  description = "Type du système d'exploitation"
}

# Configuration du fournisseur Proxmox
provider "proxmox" {
  pm_api_url      = var.pm_api_url
  pm_user         = var.pm_user
  pm_password     = var.pm_password
  pm_tls_insecure = true
}

# Création de la machine virtuelle
resource "proxmox_vm_qemu" "ubuntu_vm" {
  name            = "ubuntu-vm"
  clone           = "template"
  target_node     = var.target_node
  target_storage  = var.target_storage
  full_clone      = true

  network {
    model  = "virtio"
    bridge = var.bridge
  }

  disk {
    id      = 0
    storage = var.target_storage
    size    = var.disk_size
  }

  os_type = var.os_type
}
