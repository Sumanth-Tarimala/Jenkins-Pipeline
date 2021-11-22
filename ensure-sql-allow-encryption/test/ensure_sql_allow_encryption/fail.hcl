module "tfconfig-functions" {
  source = "../../tfconfig-functions.sentinel"
}

mock "tfconfig/v2" {
  module {
    source = "mock-tfconfig-v2-failure.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}