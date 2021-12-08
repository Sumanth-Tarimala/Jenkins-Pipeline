resource "google_composer_environment" "test" {
  provider = google-beta
  name   = "example-composer-env"
  region = var.region
  project = var.project
  config {

    node_config {
      zone         = var.zone
      machine_type = "n1-standard-1"

      network         = "projects/terraform1-330807/global/networks/default"
      subnetwork      = "projects/terraform1-330807/global/subnetworks/default"
      service_account = "sucheta@terraform1-330807.iam.gserviceaccount.com"
    }

    database_config {
      machine_type = "db-n1-standard-2"
    }

    web_server_config {
      machine_type = "composer-n1-webserver-2"
    }
  }
}
