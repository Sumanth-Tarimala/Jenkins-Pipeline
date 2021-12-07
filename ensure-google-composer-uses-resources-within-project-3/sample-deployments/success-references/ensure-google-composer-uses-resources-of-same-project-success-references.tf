resource "google_composer_environment" "composerenv" {
  provider = google-beta
  project  = "sentinel-composer"
  name     = "composer-env-sentinel"
  region   = "us-central1"
  config {
    node_count = 4

    node_config {
      zone         = "us-central1-a"
      machine_type = "n1-standard-1"

      network    = google_compute_network.composernetwork.id
      subnetwork = google_compute_subnetwork.composersubnetwork.id

      service_account = google_service_account.composerSA.name
    }

    database_config {
      machine_type = "db-n1-standard-2"
    }

    web_server_config {
      machine_type = "composer-n1-webserver-2"
    }
  }
}

resource "google_compute_network" "composernetwork" {
  project                 = "sentinel-composer"
  name                    = "composer-test-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "composersubnetwork" {
  project       = "sentinel-composer"
  name          = "composer-test-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.composernetwork.id
}

resource "google_service_account" "composerSA" {
  project      = "sentinel-composer"
  account_id   = "composer-env-account"
  display_name = "Test Service Account for Composer Environment"
}

resource "google_project_iam_member" "composer-worker" {
  project = "sentinel-composer"
  role   = "roles/composer.worker"
  member = "serviceAccount:${google_service_account.composerSA.email}"
}