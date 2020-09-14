variable "hcloud_token" {}
# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = "${var.hcloud_token}"
}
#  Main ssh key
resource "hcloud_ssh_key" "default" {
  name       = "main ssh key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}
resource "hcloud_server" "testnode1" {
  name        = "testnode1"
  image       = "ubuntu-16.04"
  server_type = "cx11"
  ssh_keys    = ["${hcloud_ssh_key.default.name}"]
}
output "public_ip4" {
  value = "${hcloud_server.testnode1.ipv4_address}"
}
