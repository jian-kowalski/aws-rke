terraform {
  required_providers {
    rke = {
      source  = "rancher/rke"
      version = "1.3.1"
    }
  }
}

# Configure the RKE provider
# provider "rke" {
# debug    = true
# log_file = "./rke_log"
# }
