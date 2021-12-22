resource "google_cloud_tasks_queue" "sample" {
    name = var.name
    location = var.location
}