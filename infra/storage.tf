resource "google_storage_bucket" "bucket" {
  project  = var.project_id
  name     = "${var.environment}-demo-bucket"
  location = var.region
}

resource "google_storage_bucket_object" "archive" {
  name   = "app.zip"
  bucket = google_storage_bucket.bucket.name
  source = "../app.zip"
}
