provider "google" {
  project = var.project_id
  
}

module "create_app" {
  source = "../modules/app_engine_existing_project"
  # project_name = var.project_name
  project_id = var.project_id
  location_id = var.location_id
}

output "app_data" {
    value = module.create_app.app_engine_details

}