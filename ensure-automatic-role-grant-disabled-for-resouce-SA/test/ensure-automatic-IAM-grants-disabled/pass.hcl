mock "tfplan/v2" {
  module {
    source = "mock-tfplan-v2-success.sentinel"
  }
}
module "tfplan-functions" {
  source = "../../tfplan-functions.sentinel"
}

test {
  rules = {
    main = true
  }
}