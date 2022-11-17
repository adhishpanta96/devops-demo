resource "google_storage_bucket" "bucket" {
  project  = var.project_id
  name     = "adhish-demo-${var.environment}-demo-bucket"
  location = var.region
}

