    resource "google_bigquery_dataset" "sample" {
        project = var.project_id
        dataset_id = var.dataset_id
        friendly_name = var.friendly_name
        description = var.description
        location = var.location
}