resource "google_project_service" "app_engine_service" {
    # project = var.project_id
    service = "appengine.googleapis.com"
    disable_dependent_services = true
}

resource "google_project_service" "cloud_resource_service" {
    # project = var.project_id
    service = "cloudresourcemanager.googleapis.com"
    disable_dependent_services = true
}


resource "google_app_engine_application" "app" {

    # project = var.project_id
    location_id = var.location_id
    depends_on = [ google_project_service.app_engine_service , google_project_service.cloud_resource_service] 
}