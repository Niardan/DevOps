terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.60.0"
    }
  }
  required_version = ">= 0.13"
}

variable "zone" {
  description = "Use specific availability zone"
  type        = string
  default     = "ru-central1-a"
}

provider "yandex" {
  zone = var.zone
}

resource "yandex_vpc_network" "terraform-network" {
  name = "terraform-network"
}

resource "yandex_vpc_subnet" "terraform-subnet" {
  name           = "terraform-subnet"
  zone           = var.zone
  network_id     = yandex_vpc_network.terraform-network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

data "yandex_compute_image" "server_image" {
  family = "lemp"
}

resource "yandex_compute_instance" "server-1" {
  name = "server1"
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.server_image.id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.terraform-subnet.id
    nat       = true
  }

  metadata = {
    ssh-key = file("~/.ssh/id_rsa.pub")
  }
}

output "external_ip_address_server_1" {
  value = yandex_compute_instance.server-1.network_interface.0.nat_ip_address
}
