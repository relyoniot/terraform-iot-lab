#
# Configure the openstack provider
#
provider "openstack" {
  user_name  = "${var.user_name}"
  tenant_name = "${var.tenant_name}"
  password  = "${var.password}"
  insecure = true
  auth_url  = "${var.auth_url}"
}

#
# Keypair
#
resource "openstack_compute_keypair_v2" "terraform" {
  name = "SSH keypair for Customer ${var.customer} Environment ${var.environment}"
  region = "${var.region}"
  public_key = "${file("${var.ssh_key_file}.pub")}"
}
