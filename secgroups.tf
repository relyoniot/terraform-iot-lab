resource "openstack_compute_secgroup_v2" "jumpserver" {
  name = "terraform_${var.customer}_${var.environment}_jumpserver"
  region = "${var.region}"
  description = "Security group for the jumpserver instance"
  rule {
    from_port = 22
    to_port = 22
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
}

resource "openstack_compute_secgroup_v2" "es" {
  name = "terraform_${var.customer}_${var.environment}_es"
  region = "${var.region}"
  description = "Security group for the es instances"
  rule {
    from_port = 22
    to_port = 22
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
  rule {
    from_port = 9200 
    to_port = 9300
    ip_protocol = "tcp"
    cidr = "172.0.0.0/8"
  }

}

