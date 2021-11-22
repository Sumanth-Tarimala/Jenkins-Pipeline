locals {
  default_sql-kms-crypto = "sql_kms_crypto2"
  branch_sql-kms-crypto  = "${local.default_sql-kms-crypto}_${random_id.id.hex}"
  sql-kms-crypto         = var.branchname != "release" ? local.branch_sql-kms-crypto : local.default_sql-kms-crypto
}

resource "google_project_service" "sql-kms-crypto-service" {
  service = "sql-component.googleapis.com"
  disable_dependent_services = true
  disable_on_destroy = false
}

resource "google_kms_key_ring" "sql-kms-crypto-ring" {
  name     = local.sql-kms-crypto
  location = var.region
}


resource "google_kms_crypto_key" "sql-kms-crypto-key" {
  depends_on = [
    google_kms_key_ring.sql-kms-crypto-ring
  ]
  name     = local.sql-kms-crypto
  key_ring = google_kms_key_ring.sql-kms-crypto-ring.id
}

resource "random_id" "db_name_suffix_sql_encrypt5" {
  byte_length = 4
}

resource "google_sql_database_instance" "instance" {
  provider = google-beta
  name             = "private-instance-${random_id.db_name_suffix_sql_encrypt5.hex}"
  region           = "us-east1"
  database_version = "MYSQL_5_7"
  encryption_key_name = google_kms_crypto_key.sql-kms-crypto-key.id
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled    = true
    }
  }

}


resource "google_kms_crypto_key_iam_member" "sql-kms-crypto-member" {
  depends_on = [
    google_kms_crypto_key.sql-kms-crypto-key
  ]
  crypto_key_id = google_kms_crypto_key.sql-kms-crypto-key.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:sentinel-sql@sentinel-sumanth.iam.gserviceaccount.com"
}