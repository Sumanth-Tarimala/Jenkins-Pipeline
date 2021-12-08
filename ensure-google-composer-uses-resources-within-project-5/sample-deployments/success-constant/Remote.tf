terraform {
  backend "remote" {
    organization = "Sumanth6798"

    workspaces {
      name = "Sumanth6798"
    }
  }
}