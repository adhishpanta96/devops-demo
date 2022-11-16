resource "google_cloudbuild_trigger" "dev-infra-plan-cloudbuild-trigger" {
  location        = "${var.region}"
  project         = "${var.project}"
  name            = "dev-infra-plan"
  filename        = "cicd/cloudbuild/infra-plan.yaml"

  tags = ["dev"]

  substitutions   = {
    _IMAGE        = "${var.deploy_image}"
    _ENV          = "dev"
  }

  github {
    owner = "adhishpanta96"
    name  = "devops-demo"
    pull_request {
      branch = "^main$"
    }
  }
  service_account = "projects/adhish-demo-foundations/serviceAccounts/adhish-demo-dev-sa@adhish-demo-foundations.iam.gserviceaccount.com"
  include_build_logs = "INCLUDE_BUILD_LOGS_WITH_STATUS"
}

resource "google_cloudbuild_trigger" "dev-infra-apply-cloudbuild-trigger" {
  location        = "${var.region}"
  project         = "${var.project}"
  name            = "dev-infra-apply"
  filename        = "cicd/cloudbuild/infra-apply.yaml"


  tags = ["dev"]

  substitutions   = {
    _IMAGE        = "${var.deploy_image}"
    _ENV          = "main"
  }

  github {
    owner = "adhishpanta96"
    name  = "devops-demo"
    push {
      branch = "^main$"
    }
  }

  service_account = "projects/adhish-demo-foundations/serviceAccounts/adhish-demo-dev-sa@adhish-demo-foundations.iam.gserviceaccount.com"
  include_build_logs = "INCLUDE_BUILD_LOGS_WITH_STATUS"
}
