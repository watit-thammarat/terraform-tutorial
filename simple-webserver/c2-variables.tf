# Input Variables
# GCP Project
variable "gcp_project" {
  description = "Project in which GCP Resources to be created"
  type        = string
  default     = "kdaida123"
}

# GCP Region
variable "gcp_region" {
  description = "Region in which GCP Resources to be created"
  type        = string
  default     = "us-east1"
}

# GCP Zone
variable "gcp_zone" {
  description = "Zone in which GCP Resources to be created"
  type        = string
  default     = "us-east1-a"
}

# GCP Compute Engine Machine Type
variable "machine_type" {
  description = "Compute Engine Machine Type"
  type        = string
  default     = "e2-small"
}
