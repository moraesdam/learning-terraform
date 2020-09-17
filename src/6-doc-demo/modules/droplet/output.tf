output "droplet_id" {
  value = digitalocean_droplet.droplet.*.id
}
