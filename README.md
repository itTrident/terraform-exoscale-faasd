# faasd for Exoscale

This repo contains a Terraform Module for how to deploy a [faasd](https://github.com/openfaas/faasd) instance on the
[Exoscale](https://www.exoscale.com/) using [Terraform](https://www.terraform.io/).

__faasd__, a lightweight & portable faas engine, is [OpenFaaS](https://github.com/openfaas/) reimagined, but without the cost and complexity of Kubernetes. It runs on a single host with very modest requirements, making it fast and easy to manage. Under the hood it uses [containerd](https://containerd.io/) and [Container Networking Interface (CNI)](https://github.com/containernetworking/cni) along with the same core OpenFaaS components from the main project.

## What's a Terraform Module?

A Terraform Module refers to a self-contained packages of Terraform configurations that are managed as a group. This repo
is a Terraform Module and contains many "submodules" which can be composed together to create useful infrastructure patterns.

## How do you use this module?

This repository defines a [Terraform module](https://www.terraform.io/docs/modules/usage.html), which you can use in your
code by adding a `module` configuration and setting its `source` parameter to URL of this repository:

```hcl
module "faasd" {
  source = "https://github.com/itTrident/terraform-exoscale-faasd"
  name   = "faasd"
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.1.7 |
| exoscale | >= 0.35 |
| random | >=3.1.2 |

## Providers

| Name | Version |
|------|---------|
| exoscale | >= 0.35 |
| random | >=3.1.2 |

## Resources

| Name | Type |
|------|------|
| [exoscale_compute_instance](https://registry.terraform.io/providers/exoscale/exoscale/latest/docs/resources/compute_instance) | resource |
| [exoscale_security_group](https://registry.terraform.io/providers/exoscale/exoscale/latest/docs/resources/security_group) | resource |
| [exoscale_ssh_key](https://registry.terraform.io/providers/exoscale/exoscale/latest/docs/resources/ssh_key) | resource |
| [random_password.faasd](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| basic\_auth\_password | The basic auth password, if left empty, a random password is generated. | `string` | `null` | no |
| basic\_auth\_user | The basic auth user name. | `string` | `""` | no |
| domain | A public domain for the faasd instance. This will the use of Caddy and a Let's Encrypt certificate | `string` | `""` | no |
| email | Email used to order a certificate from Let's Encrypt | `string` | `""` | no |
| instance\_type | The instance type to use for the instance. | `string` | `""` | no |
| ssh\_key\_name | Key name of the Key Pair to use for the instance. | `string` | `""` | yes |
| ssh\_pub\_key | Public Key Pair to use for the instance. | `string` | `""` | yes |
| name | The name of the faasd instance. | `string` | `""` | yes |
| zone | The name of the zone to deploy the faasd into. | `string` | `""` | yes |
| disk | The disk is to set the storage for instance | `number` | `""` | no |
| temp\_name | The name is to set the template. | `string` | `""` | yes |
| exoscale\_api_key | API key for exoscale. | `string` | `""` | yes |
| exoscale\_api_secret | API secret key for exoscale. | `string` | `""` | yes |

## Outputs

| Name | Description |
|------|-------------|
| basic\_auth\_password | The basic auth password. |
| basic\_auth\_user | The basic auth user name. |
| gateway\_url | The url of the faasd gateway |
| ipv4\_address | The public IP address of the faasd instance |

## See Also

- [faasd on Amazon Web Services with Terraform](https://github.com/jsiebens/terraform-aws-faasd)
- [faasd on Google Cloud Platform with Terraform](https://github.com/jsiebens/terraform-google-faasd)
- [faasd on Microsoft Azure with Terraform](https://github.com/jsiebens/terraform-azurerm-faasd)
- [faasd on DigitalOcean with Terraform](https://github.com/jsiebens/terraform-digitalocean-faasd)
- [faasd on Equinix Metal with Terraform](https://github.com/jsiebens/terraform-equinix-faasd)
- [faasd on Scaleway with Terraform](https://github.com/jsiebens/terraform-scaleway-faasd)
- [faasd on Vultr with Terraform](https://github.com/itTrident/terraform-vultr-faasd)
- [faasd on Linode with Terraform](https://github.com/itTrident/terraform-linode-faasd)
