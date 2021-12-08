mock "tfconfig/v2" {
  module {
    source = "mock-tfconfig-v2-undefined.sentinel"
  }
}

module "tfconfig-functions" {
  source = "../../tfconfig-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-v2-success-constant.sentinel"
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