resource "google_composer_environment" "test" {
  provider = google-beta
  name   = "example-composer-env"
  region = "us-east4"
  project = "composersentinel"
  config {

    node_config {
      zone         = "us-east4-a"
      machine_type = "n1-standard-1"
    }

    database_config {
      machine_type = "db-n1-standard-2"
    }

    web_server_config {
      machine_type = "composer-n1-webserver-2"
    }
  }
}
