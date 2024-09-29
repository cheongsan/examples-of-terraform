variable "instance_names" {
  description = "openstack-인스턴스 이름"
  type    = list(string)
  default = ["control", "network", "compute", "storage"]
}

variable "instance_hostnames" {
  description = "openstack 인스턴스의 호스트명"
  type        = list(string)
  default     = ["control.openstack.cheogsan.com", "network.openstack.cheogsan.com", 
                 "compute.openstack.cheogsan.com", "storage.openstack.cheogsan.com"]
}