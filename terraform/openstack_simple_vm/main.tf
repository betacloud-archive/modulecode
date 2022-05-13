locals {
  ips = [
    module.vm01.floating_ip,
  ]
}

module "vm01" {
  source = "./modules/openstack_composed/vm_without_firewall"

  name        = "example-vm"
  flavor_name = "2C-2GB-10GB"
}
