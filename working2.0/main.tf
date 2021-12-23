provider "google" {
  project = var.project_id

}

module "create_app" {
  source      = "../modules/app_engine_existing_project"
  project_id  = var.project_id
  location_id = var.location_id
}

module "create_cloud_tasks_queue" {
  source   = "../modules/cloud_task_queue_basic"
  project_id = var.project_id
  name     = var.name
  location = var.cloud_task_location
}

output "app_data" {
  value = module.create_app.app_engine_details
}

output "cloud_task_queue_data" {
  value = module.create_cloud_tasks_queue.queue_details
}