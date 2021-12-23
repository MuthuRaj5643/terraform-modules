resource "google_project_service" "cloud_task_service" {
    project = var.project_id
    service = "cloudtasks.googleapis.com"
    disable_dependent_services = true
}

resource "google_cloud_tasks_queue" "sample" {
    name = var.name
    location = var.location
    depends_on = [ google_project_service.cloud_task_service ] 
}