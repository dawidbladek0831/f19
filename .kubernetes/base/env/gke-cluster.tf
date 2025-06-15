resource "google_container_cluster" "gke_cluster" {
  name                     = "f-gke-cluster"
  location                 = var.zone
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc_network.name
  subnetwork = google_compute_subnetwork.subnet.name

  ip_allocation_policy {}

  release_channel {
    channel = "STABLE"
  }

  workload_identity_config {
    workload_pool = "${var.project}.svc.id.goog"
  }

  gateway_api_config {
    channel = "CHANNEL_STANDARD"
  }
}

resource "google_container_node_pool" "gke_nodes" {
  name       = "primary-pool"
  cluster    = google_container_cluster.gke_cluster.name
  location   = var.zone
  node_count = 2

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]

    service_account = google_service_account.account.email
    tags            = ["http", "https", "ssh"]

    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}

resource "google_project_iam_member" "sa_roles" {
  project = var.project
  member  = "serviceAccount:${google_service_account.account.email}"

  for_each = toset([
    "roles/container.nodeServiceAccount",
    "roles/compute.networkUser",
    "roles/iam.serviceAccountUser"
  ])
  role = each.value
}