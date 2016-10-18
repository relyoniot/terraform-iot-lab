resource "openstack_compute_floatingip_v2" "jumpserver" {
  depends_on = ["openstack_networking_router_interface_v2.frontend"]
  region = "${var.region}"
  pool = "${var.pool}"
}
