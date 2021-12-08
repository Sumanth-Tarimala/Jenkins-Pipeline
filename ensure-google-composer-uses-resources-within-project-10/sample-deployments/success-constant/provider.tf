provider "google" {
 credentials = file("sentinel-sumanth-d3b29a50fb15.json")
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
 credentials = file("sentinel-sumanth-d3b29a50fb15.json")
 project     = var.project
 region      = var.region
 zone        = var.zone

}

