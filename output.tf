output "SSH connect string jumpserver" {
    value = "ssh -i ${var.ssh_key_file} ${var.jumpserver_username}@${openstack_compute_floatingip_v2.jumpserver.address} -o 'ProxyCommand ssh -A -i ${var.ssh_key_file} ${var.jumpserver_username}@${openstack_compute_floatingip_v2.jumpserver.address} -W ${openstack_compute_floatingip_v2.jumpserver.address}:22' "
}

output "SSH connect string es server" {
#    value = "ssh -i ${var.ssh_key_file} ${var.jumpserver_username}@${openstack_compute_floatingip_v2.jumpserver.address} -o 'ProxyCommand ssh -A -i ${var.ssh_key_file} ${var.jumpserver_username}@${openstack_compute_floatingip_v2.jumpserver.address} -W ${openstack_compute_instance_v2.es.1.access_ip_v4}:22' "

value = "ssh -i ${var.ssh_key_file} ${var.es_username}@${openstack_compute_instance_v2.es.1.access_ip_v4} -o 'ProxyCommand ssh -A -i ${var.ssh_key_file} ${var.jumpserver_username}@${openstack_compute_floatingip_v2.jumpserver.address} -W ${openstack_compute_instance_v2.es.1.access_ip_v4}:22' "
}


