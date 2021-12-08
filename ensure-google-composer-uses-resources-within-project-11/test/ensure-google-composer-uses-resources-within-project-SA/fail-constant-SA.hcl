module "tfconfig-functions" {
  source = "../../tfconfig-functions.sentinel"
}

mock "tfconfig/v2" {
  module {
    source = "mock-tfconfig-v2-failure-constant-SA.sentinel"
  }
}

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-v2-failure-constant-SA.sentinel"
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