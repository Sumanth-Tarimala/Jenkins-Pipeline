module "tfconfig-functions" {
  source = "../../tfconfig-functions.sentinel"
}

mock "tfconfig/v2" {
  module {
    source = "mock-tfconfig-v2-success-multiple.sentinel"
  }
}

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-v2-success-multiple.sentinel"
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