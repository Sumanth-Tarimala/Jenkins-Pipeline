mock "tfplan/v2" {
  module {
    source = "mock-tfplan-v2-failure.sentinel"
  }
}

module "tfplan-functions" {
  source = "../../tfplan-functions.sentinel"
}

test {
  rules = {
    main = false
  }
}