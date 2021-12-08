resource "google_composer_environment" "test" {
  provider = google-beta
  name   = "example-composer-env"
  region = "us-east4"
  project = "composersentinel"
  config {

    node_config {
      zone         = "us-east4-a"
      machine_type = "n1-standard-1"

      network         = "projects/composersentinel1/global/networks/default"
      subnetwork      = "projects/composersentinel1/global/subnetworks/default"
      service_account = "sentinelsql@composersentinel1.iam.gserviceaccount.com"
    }

    database_config {
      machine_type = "db-n1-standard-2"
    }

    web_server_config {
      machine_type = "composer-n1-webserver-2"
    }
  }
}
