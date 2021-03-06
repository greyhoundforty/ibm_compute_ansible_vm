data "ibm_compute_ssh_key" "deploymentKey" {
  label = "ryan_tycho"
}

resource "ibm_compute_vm_instance" "ansible_node" {
  count                = "${var.node_count}"
  hostname             = "${var.hostname}-${count.index+1}"
  domain               = "${var.domain}"
  os_reference_code    = "${var.os_reference_code}"
  datacenter           = "${var.datacenter}"
  network_speed        = 1000
  hourly_billing       = true
  private_network_only = false
  user_metadata        = "${var.user_metadata}"
  flavor_key_name      = "${var.flavor_key_name}"
  local_disk           = "${var.localdisk}"
  tags                 = ["ryantiffany", "ansible-node"]
  ssh_key_ids          = ["${data.ibm_compute_ssh_key.deploymentKey.id}"]
}
