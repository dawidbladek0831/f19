terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.38.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = "europe-central2"
  zone    = "europe-central2-a"
}