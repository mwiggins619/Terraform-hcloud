# Create a server
resource "hcloud_server" "web" {
  name        = "my-server"
  image       = "ubuntu-18.04"
  server_type = "cx11"
}