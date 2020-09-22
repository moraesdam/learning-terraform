# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "droplet" {
  image  = var.image
  name   = var.name
  region = var.region
  size   = var.size
}

resource "digitalocean_firewall" "web" {
  name = "web-firewall-rules"

  droplet_ids = [digitalocean_droplet.droplet.id]

  dynamic "inbound_rule" {
    for_each = var.default_firewall
    content {  
      protocol         = inbound_rule.value["protocol"]
      port_range       = inbound_rule.key
      source_addresses = inbound_rule.value["source_addresses"]
    }
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "53"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
