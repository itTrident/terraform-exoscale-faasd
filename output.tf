output "gateway_url" {
  description = "The url of the faasd gateway"
  value       = var.domain == null || var.domain == "" ? format("http://%s:8080", exoscale_compute_instance.faasd.public_ip_address) : format("https://%s", var.domain)
}

output "basic_auth_user" {
  value = var.basic_auth_user
}

output "basic_auth_password" {
  sensitive = true
  value     = local.basic_auth_password
}

output "ipv4_address" {
  value = exoscale_compute_instance.faasd.public_ip_address
}