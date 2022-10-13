terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.60.0"
    }
  }

  backend "s3" {
    endpoint                    = "storage.yandexcloud.net"
    bucket                      = "remote-niardan-state-storage"
    region                      = "ru-central1"
    key                         = "issue1/lemp.tfstate"
    access_key                  = "key"
    secret_key                  = "secret_key"
    skip_region_validation      = true
    skip_credentials_validation = true
  }

  required_version = ">= 0.13"
}

provider "yandex" {
}