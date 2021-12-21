module "create_dataset_table" {
    source = "../modules/big_query"
    dataset_id = var.dataset_id
    friendly_name = var.friendly_name
    description = var.description
    location = var.location
    project_id = var.project_id
    table_id = var.table_id
    source_format = var.source_format
    source_uris = var.source_uris
    autodetect = var.autodetect
    deletion_protection = var.deletion_protection

}

output "dataset_details" {
    value = module.create_dataset_table.dataset_details
}

output "table_details" {
    value = module.create_dataset_table.table_details
}