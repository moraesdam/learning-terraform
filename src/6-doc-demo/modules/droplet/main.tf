# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "droplet" {
  image  = var.image
  name   = var.name
  region = var.region
  size   = var.size
}
