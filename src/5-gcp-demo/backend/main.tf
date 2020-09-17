provider "google" {
  version = "~> 2.5"
  project = "vital-plating-288304"
  region  = "us-central1"
}

resource "google_storage_bucket" "backend" {
  name          = "dmoraes-ca-demo-tf-state"
  location      = "US"
  force_destroy = "true"
}
