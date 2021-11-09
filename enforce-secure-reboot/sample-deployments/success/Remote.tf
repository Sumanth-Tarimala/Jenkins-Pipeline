terraform {
  backend "remote" {
    organization = "SumanthTarimala"

    workspaces {
      name = "SumanthTarimala"
    }
  }
}