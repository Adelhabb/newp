variable "pm_api_url" {
  description = "URL de l'API Proxmox"
  default     = "https://192.168.217.128:8006/api2/json"
}

variable "pm_user" {
  description = "Nom d'utilisateur Proxmox"
  default     = "root"
}

variable "pm_password" {
  description = "Mot de passe Proxmox"
  default     = "adminprox"
}

variable "target_node" {
  description = "Nom du nœud Proxmox"
  default     = "pve"  // Remplacez "pve" par le nom de votre nœud Proxmox
}

variable "target_storage" {
  description = "Nom du stockage Proxmox"
  default     = "local-lvm"  // Remplacez "local" par le nom de votre stockage Proxmox
}

variable "bridge" {
  description = "Nom du réseau bridge"
  default     = "vmbr0"  // Remplacez "vmbr0" par le nom de votre pont réseau Proxmox
}

variable "disk_size" {
  description = "Taille du disque pour la machine virtuelle"
  default     = "1G"    // Remplacez "10G" par la taille souhaitée pour le disque de la VM
}

variable "os_type" {
  description = "Type du système d'exploitation"
  default     = "l26" // Remplacez "ubuntu" par le type de système d'exploitation de votre choix
}

variable "template" {
  description = "Modèle pour la création de la machine virtuelle"
  type        = string
  default     = "temp"
}
