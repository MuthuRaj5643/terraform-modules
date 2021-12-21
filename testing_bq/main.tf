provider "google" {
    project_id = var.project_id
}

module "create_dataset" {
    source = "../modules/big_query"
    dataset_id = var.dataset_id
    friendly_name = var.friendly_name
    description = var.description
    location = var.location
}