variable "folder_id" {
  type    = string
  default = "default"

}

resource "yandex_vpc_network" "terraform-network" {
  name = "terraform-network"
}

resource "yandex_vpc_subnet" "subnet1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.terraform-network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_vpc_subnet" "subnet2" {
  name           = "subnet2"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.terraform-network.id
  v4_cidr_blocks = ["192.168.11.0/24"]
}

module "ya_instance_1" {
  source         = "./modules/instance"
  instance_image = "lemp"
  instance_name  = "ya_instance_1"
  subnet_id      = yandex_vpc_subnet.subnet1.id
}

module "ya_instance_2" {
  source         = "./modules/instance"
  instance_image = "lamp"
  instance_name  = "ya_instance_2"
  subnet_id      = yandex_vpc_subnet.subnet2.id
}

output "external_ip_address_server_1" {
  value = module.ya_instance_1.external_ip_address_vm
}

resource "yandex_iam_service_account" "sa" {
  folder_id = var.folder_id
  name      = "sa-skillfactory"
}

resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "static key for object storage"
}

resource "yandex_storage_bucket" "remote-state-storage" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket     = "tf-state-storage"
}
