terraform {
  required_providers {
    digitalocean = {
      version = "1.22.2"
    }
  }

  #   backend "s3" {
  #                 skip_requesting_account_id = true
  #                 skip_credentials_validation = true
  #                 skip_get_ec2_platforms = true
  #                 skip_metadata_api_check = true
  #                 access_key = "XXXXXXXXX"
  #                 secret_key = "XXXXXXXXXXXXXXXXXXXXXXXXX"
  #                 endpoint = "https://xxx.digitaloceanspaces.com"
  #                 region = "us-east-1"
  #                 bucket = "XXXXXXX" // name of your space
  #                 key = "production/terraform.tfstate"
  #         }
}

module "droplet" {
  source = "./modules/droplet"
  name   = "web-1"
  size   = "s-1vcpu-1gb"
}
