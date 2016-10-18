# specify customer and environment
variable "customer" {
    default = "relyoniot"
}

variable "environment" {
    default = "lab"
}

# specify external domain base
variable "domain_base" {
    default = "openstack.rely.nl"
}

variable "aws_zone_id" {
   default = "Z3SLZMRUV9F993"
}

# specify stack user
variable "user_name" {}

# set password as 'export TF_VAR_password=<password>'
variable "password" {}

# generate your own key
variable "ssh_key_file" {
    default = "~/.ssh/id_rsa.relyoniot"
}

############### hostnames ################
variable "jumpserver_hostname" {
    default = "jumpserver"
}

variable "es_hostname" {
    default = "es"
}

############### number of servers ###############
variable "es_count" {
    default = "3"
}


############### User definitions ###############
variable "es_username" {
    default = "ubuntu"
}
variable "jumpserver_username" {
    default = "ubuntu"
}

############### security groups ###############
variable "secgroup_front_cidr" {
    default = "172.0.10.0/24"
}
variable "secgroup_back_cidr" {
    default = "172.0.20.0/24"
}

############### Environment settings for Rely_openstack DirICT ###################
variable "tenant_name" {
    default = "relyoniot"
}

variable "auth_url" {
    default = "https://access.openstack.rely.nl:5000/v2.0"
}

variable "region" {
    default = "RegionOne"
}

variable "external_gateway" {
    default = "2613fe91-7fa1-4033-8fd3-678e7e9e15e7"
}

variable "pool" {
    default = "external"
}

variable "image_ub" {
    default = "Ubuntu 16.04 LTS"
}

variable "flavor_es" {
    default = "ha_localdisk.4c.16r.60h"
}

variable "flavor_jumpserver" {
    default = "ha_localdisk.2c.4r.20h"
}


