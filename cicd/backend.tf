terraform {
    backend "gcs" {
        bucket = "adhish-demo-foundations-terraform-backend"
        prefix = "infra/cicd"
    }
}
