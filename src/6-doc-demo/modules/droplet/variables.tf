variable "name" {}

variable "region" {
  type    = string
  default = "sfo2"
}

variable "image" {
  type    = string
  default = "ubuntu-18-04-x64"
}

variable "size" {}

variable "default_firewall" {
  type = map(object({description = string, protocol = string, source_addresses = list(string)}))
  default = {
    22 = { description = "ssh", protocol = "tcp", source_addresses = ["192.168.1.0/24", "2002:1:2::/48"] }
    80 = { description = "http", protocol = "tcp", source_addresses = ["192.168.1.0/24", "2002:1:2::/48"] }
    "icmp" = { description = "icmp", protocol = "icmp", source_addresses = ["0.0.0.0/0", "::/0"] }
  }
}
