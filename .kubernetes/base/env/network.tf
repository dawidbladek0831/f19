# resource "google_compute_global_address" "gateway_ip_address" {
#   name         = "gateway-ip-address"
#   ip_version   = "IPV4"
#   address_type = "EXTERNAL"
# }

resource "google_compute_network" "vpc_network" {
  name = "f-vpc-network"
}

resource "google_compute_subnetwork" "subnet" {
  name          = "f-subnet"
  ip_cidr_range = "10.0.0.0/24"
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_firewall" "ssh" {
  name    = "ssh-access"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags   = ["ssh"]
  source_ranges = ["178.214.26.24/32"]
}

resource "google_compute_firewall" "http" {
  name    = "http-access"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80", "8080"]
  }
  target_tags   = ["http"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "https" {
  name    = "https-access"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  target_tags   = ["https"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "icmp" {
  name    = "icmp-access"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  target_tags   = ["icmp"]
  source_ranges = ["0.0.0.0/0"]
}