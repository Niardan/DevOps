resource "yandex_lb_target_group" "my-target-group" {
  name      = "my-target-group"
  region_id = "ru-central1"

  target {
    subnet_id = yandex_vpc_subnet.subnet1.id
    address   = module.ya_instance_1.internal_ip_address_server
  }

  target {
    subnet_id = yandex_vpc_subnet.subnet2.id
    address   = module.ya_instance_2.internal_ip_address_server
  }
}

resource "yandex_lb_network_load_balancer" "load_balancer" {
  name = "my-network-load-balancer"

  listener {
    name = "my-listener"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.my-target-group.id

    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}

output "external_ip_address_load_balancer" {
  value = yandex_lb_network_load_balancer.load_balancer.listener[*].external_address_spec[*].address
  description = "load balancer external address"
}