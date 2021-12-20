module "create_app" {
  source = "../modules/app_engine"
  project_name = var.project_name
  project_id = var.project_id
  location_id = var.location_id
}

output "app_data" {
    value = module.create_app.app_engine_details

}