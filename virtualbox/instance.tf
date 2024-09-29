resource "virtualbox_vm" "node" {
  count     = 4
  name      = format("openstack-%s", element(var.instance_names, count.index))
  image     = "https://app.vagrantup.com/rockylinux/boxes/9/versions/4.0.0/providers/virtualbox/amd64/vagrant.box"
  cpus      = 2
  memory    = "8192 mib"
  user_data = file("${path.module}/user_data.sh")

  provisioner "local-exec" {
    command = "bash ${path.module}/update_hosts.sh ${self.network_adapter[1].ipv4_address} ${var.instance_hostnames[count.index]}"
  }

  network_adapter {
    type           = "nat"
    host_interface = "NatNetwork"
  }

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet1"
  }

  network_adapter {
    type           = "internal"
    host_interface = "intnet"
  }
}