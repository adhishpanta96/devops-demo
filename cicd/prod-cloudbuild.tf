resource "google_cloudbuild_trigger" "prod-infra-plan-cloudbuild-trigger" {
  location        = "${var.region}"
  project         = "${var.project}"
  name            = "prod-infra-plan"
  filename        = "cicd/cloudbuild/infra-plan.yaml"
  ignored_files   = [
    "cicd/*"
  ]

  tags = ["prod"]

  substitutions   = {
    _IMAGE        = "${var.deploy_image}"
    _ENV          = "prod"
  }

  github {
    owner = "adhishpanta96"
    name  = "devops-demo"
    push {
      branch = "^main$"
    }
  }
  service_account = "projects/adhish-demo-foundations/serviceAccounts/adhish-demo-prod-sa@adhish-demo-foundations.iam.gserviceaccount.com"
  include_build_logs = "INCLUDE_BUILD_LOGS_WITH_STATUS"
}

resource "google_cloudbuild_trigger" "prod-infra-apply-cloudbuild-trigger" {
  location        = "${var.region}"
  project         = "${var.project}"
  name            = "prod-infra-apply"
  filename        = "cicd/cloudbuild/infra-apply.yaml"
  ignored_files   = [
    "cicd/*"
  ]

  tags = ["prod"]

  substitutions   = {
    _IMAGE        = "${var.deploy_image}"
    _ENV          = "prod"
  }

  github {
    owner = "adhishpanta96"
    name  = "devops-demo"
    push {
      tag = "^prod"
    }
  }

  service_account = "projects/adhish-demo-foundations/serviceAccounts/adhish-demo-prod-sa@adhish-demo-foundations.iam.gserviceaccount.com"
  include_build_logs = "INCLUDE_BUILD_LOGS_WITH_STATUS"
}

