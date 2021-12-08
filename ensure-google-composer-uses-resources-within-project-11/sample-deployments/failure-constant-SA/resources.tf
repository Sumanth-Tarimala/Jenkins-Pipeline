resource "google_composer_environment" "sentinel_composer" {
  provider = google-beta
  name   = "sentinel-composer-env"
  region = var.region
  project = var.project
  config {

    node_config {
      zone         = var.zone
      machine_type = "n1-standard-1"

      network         = "projects/composer-sentine/global/networks/default"
      subnetwork      = "projects/composer-sentine/global/subnetworks/default"
      service_account = "projects/composer-sentine/serviceAccounts/composer-sentinel@composer-sentine.iam.gserviceaccount.com"
    }

    database_config {
      machine_type = "db-n1-standard-2"
    }

    web_server_config {
      machine_type = "composer-n1-webserver-2"
    }
  }
}
