resource "random_id" "db_name_suffix11" {
  byte_length = 4
}

resource "google_sql_database_instance" "instance" {
  provider         = google-beta
  name             = "private-instance-${random_id.db_name_suffix11.hex}"
  region           = "us-east4"
  database_version = "MYSQL_5_7"
  
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled    = true
    }
  }
}
