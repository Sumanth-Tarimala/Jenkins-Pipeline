provider "google" {
 credentials = file("sumanth6798-4c471c48d035.json")
 project     = var.project
 region      = var.region
 zone        = var.zone

}

provider random {
  
}

resource "random_id" "id" {
	  byte_length = 8
}

provider "google-beta" {
 credentials = file("sumanth6798-4c471c48d035.json")
 project     = var.project
 region      = var.region
 zone        = var.zone

}

