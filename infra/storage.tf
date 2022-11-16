resource "google_storage_bucket" "demo-bucket" {
  project  = var.project_id
  name     = "${var.environment}-demo-bucket"
  location = var.region
}