output "NATIPAddr" {
  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 1)
}

output "HOSTIPAddr" {
  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 2)
}