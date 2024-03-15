provider "proxmox" {
  pm_api_url     = https://192.168.217.128:8006/#v1:0:=qemu%2F100:4:::::8::
  pm_user        = root
  pm_password    = adminprox
  pm_tls_insecure = true
}
