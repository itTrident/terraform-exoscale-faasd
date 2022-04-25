
variable "basic_auth_user" {
  description = "The basic auth user name."
  type        = string
  default     = "admin"
}

variable "basic_auth_password" {
  description = "The basic auth password, if left empty, a random password is generated."
  type        = string
  default     = null
  sensitive   = true
}

variable "ssh_key_name" {
  description = "Key name of the Key Pair to use for the instance."
  type        = string
  default     = ""
}

variable "ssh_pub_key" {
  description = "Public Key Pair to use for the instance."
  type        = string
  default     = ""
}

variable "zone" {
  description = "The name of the zone to deploy the faasd into."
  type        = string
  default     = "ch-gva-2"
}

variable "name" {
  description = "The name of the faasd instance."
  type        = string
  default     = "faasd"
}

variable "instance_type" {
  description = "The instance type to use for the instance."
  type        = string
  default     = "standard.micro"
}

variable "disk" {
  description = "The disk is to set the storage for instance."
  type        = number
  default     = "10"
}

variable "temp_name" {
  description = "The name is to set the template."
  type        = string
  default     = "Linux Ubuntu 20.04 LTS 64-bit"
}

variable "email" {
  description = "Email used to order a certificate from Let's Encrypt."
  type        = string
  default     = ""
}

variable "domain" {
  description = "A public domain for the faasd instance. This will be consumed by Caddy and install a Let's Encrypt certificate."
  type        = string
  default     = ""
}

variable "exoscale_api_key" {
  description = "API key for Exoscale"
  type        = string
  default     = ""
}

variable "exoscale_api_secret" {
  description = "API secret for Exoscale"
  type        = string
  default     = ""
}