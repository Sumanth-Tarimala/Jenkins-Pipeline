module "tfconfig-functions" {
  source = "../../tfconfig-functions.sentinel"
}

mock "tfconfig/v2" {
  module {
    source = "mock-tfconfig-v2-success.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}