resource "openstack_compute_instance_v2" "es" {
  name = "${var.customer}-${var.environment}-${var.es_hostname}"
  count = "${var.es_count}"
  region = "${var.region}"
  image_name = "${var.image_ub}"
  flavor_name = "${var.flavor_es}"
  key_pair = "${openstack_compute_keypair_v2.terraform.name}"
  security_groups = [ "${openstack_compute_secgroup_v2.es.name}" ]
  user_data = "${template_file.init_es.rendered}"
  network {
    uuid = "${openstack_networking_network_v2.frontend.id}"
  }
}

resource "openstack_compute_instance_v2" "jumpserver" {
  name = "${var.customer}-${var.environment}-${var.jumpserver_hostname}"
  region = "${var.region}"
  image_name = "${var.image_ub}"
  flavor_name = "${var.flavor_jumpserver}"
  key_pair = "${openstack_compute_keypair_v2.terraform.name}"
  security_groups = [ "${openstack_compute_secgroup_v2.jumpserver.name}" ]
  floating_ip = "${openstack_compute_floatingip_v2.jumpserver.address}"
#  user_data = "${template_file.init_monitor.rendered}"
  network {
    uuid = "${openstack_networking_network_v2.frontend.id}"
  }
}
