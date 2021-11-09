# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These variables are expected to be passed in by the operator
# ---------------------------------------------------------------------------------------------------------------------

variable "project" {
  description = "The project ID to host the database in."
  default     = "Sumanth6798"
}

variable "region" {
  description = "The region to host the database in."
  default     = "us-east4"
}

variable "zone" {
  description = "The zoneto host the database in."
  default     = "us-east4-a"
}

# Note, after a name db instance is used, it cannot be reused for up to one week.
variable "name_prefix" {
  description = "The name prefix for the database instance. Will be appended with a random string. Use lowercase letters, numbers, and hyphens. Start with a letter."
  default     = "sentinel"
}

variable "branchname" {
  description = "Branch name for testing"
 default     = "release"
}
