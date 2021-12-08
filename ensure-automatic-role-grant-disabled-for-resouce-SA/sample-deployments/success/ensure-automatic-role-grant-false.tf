resource "google_organization_policy" "Grant_SA_policy" {
  org_id     = "123456789"
  constraint = "iam.automaticIamGrantsForDefaultServiceAccounts"

  boolean_policy {
    enforced = false
  }
}