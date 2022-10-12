data "yandex_compute_image" "server_image" {
  family = var.instance_image
}

resource "yandex_compute_instance" "server" {
  name = "server-${var.instance_name}"
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
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-key = file("~/.ssh/id_rsa.pub")
  }
}