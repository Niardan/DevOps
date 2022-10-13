<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | 0.60.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.60.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ya_instance_1"></a> [ya\_instance\_1](#module\_ya\_instance\_1) | ./modules/instance | n/a |
| <a name="module_ya_instance_2"></a> [ya\_instance\_2](#module\_ya\_instance\_2) | ./modules/instance | n/a |

## Resources

| Name | Type |
|------|------|
| [yandex_iam_service_account.sa](https://registry.terraform.io/providers/yandex-cloud/yandex/0.60.0/docs/resources/iam_service_account) | resource |
| [yandex_iam_service_account_static_access_key.sa-static-key](https://registry.terraform.io/providers/yandex-cloud/yandex/0.60.0/docs/resources/iam_service_account_static_access_key) | resource |
| [yandex_lb_network_load_balancer.load_balancer](https://registry.terraform.io/providers/yandex-cloud/yandex/0.60.0/docs/resources/lb_network_load_balancer) | resource |
| [yandex_lb_target_group.my-target-group](https://registry.terraform.io/providers/yandex-cloud/yandex/0.60.0/docs/resources/lb_target_group) | resource |
| [yandex_resourcemanager_folder_iam_member.sa-editor](https://registry.terraform.io/providers/yandex-cloud/yandex/0.60.0/docs/resources/resourcemanager_folder_iam_member) | resource |
| [yandex_storage_bucket.remote-niardan-state-storage](https://registry.terraform.io/providers/yandex-cloud/yandex/0.60.0/docs/resources/storage_bucket) | resource |
| [yandex_vpc_network.terraform-network](https://registry.terraform.io/providers/yandex-cloud/yandex/0.60.0/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.subnet1](https://registry.terraform.io/providers/yandex-cloud/yandex/0.60.0/docs/resources/vpc_subnet) | resource |
| [yandex_vpc_subnet.subnet2](https://registry.terraform.io/providers/yandex-cloud/yandex/0.60.0/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | n/a | `string` | `"b1grtf5annaj45kv1e3p"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip_address_load_balancer"></a> [external\_ip\_address\_load\_balancer](#output\_external\_ip\_address\_load\_balancer) | load balancer external address |
<!-- END_TF_DOCS -->