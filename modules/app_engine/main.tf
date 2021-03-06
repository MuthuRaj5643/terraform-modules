resource "google_project" "my_project" {
    name = var.project_name
    project_id = var.project_id
    billing_account = var.billing_id
}

resource "google_project_service" "app_engine_service" {
    project = google_project.my_project.project_id
    service = "appengine.googleapis.com"
    disable_dependent_services = true
}

resource "google_app_engine_application" "app" {

    project = google_project.my_project.project_id
    location_id = var.location_id 
}