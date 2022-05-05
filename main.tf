locals {
  generate_password   = var.basic_auth_password == null || var.basic_auth_password == ""
  basic_auth_user     = var.basic_auth_user
  basic_auth_password = local.generate_password ? random_password.faasd[0].result : var.basic_auth_password

  user_data_vars = {
    basic_auth_user     = local.basic_auth_user
    basic_auth_password = local.basic_auth_password
    domain              = var.domain
    email               = var.email
  }
}

resource "random_password" "faasd" {
  count   = local.generate_password ? 1 : 0
  length  = 16
  special = false
}

data "exoscale_compute_template" "ubuntu" {
  zone = var.zone
  name = var.temp_name
}

resource "exoscale_security_group" "faasd" {
  name        = "faasd-sg"
  description = "OpenFaaS"
}

resource "exoscale_ssh_key" "faasd-key-pair" {
  name       = var.ssh_key_name
  public_key = var.ssh_pub_key
}

resource "exoscale_compute_instance" "faasd" {
  zone               = var.zone
  name               = var.name
  type               = var.instance_type
  labels             = var.labels
  template_id        = data.exoscale_compute_template.ubuntu.id
  disk_size          = var.disk
  security_group_ids = [exoscale_security_group.faasd.id]
  ssh_key            = exoscale_ssh_key.faasd-key-pair.id
  user_data          = templatefile("${path.module}/templates/startup.sh", local.user_data_vars)
}

resource "exoscale_security_group_rule" "firewall_rules" {
  count             = length("${var.firewall_rules}")
  security_group_id = exoscale_security_group.faasd.id
  type              = "INGRESS"
  protocol          = var.firewall_rules[count.index].protocol
  cidr              = "0.0.0.0/0"
  start_port        = var.firewall_rules[count.index].start_port
  end_port          = var.firewall_rules[count.index].end_port
}