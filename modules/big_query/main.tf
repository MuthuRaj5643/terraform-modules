resource "google_bigquery_dataset" "sample" {
    project = var.project_id
    dataset_id = var.dataset_id
    friendly_name = var.friendly_name
    description = var.description
    location = var.location      
}

resource "google_bigquery_table" "default" {
    project = var.project_id
    dataset_id = google_bigquery_dataset.sample.dataset_id
    table_id   = var.table_id
    schema = file("../modules/big_query/table_schema.json")
        
    external_data_configuration{
        autodetect = var.autodetect
        source_format = var.source_format
        source_uris = var.source_uris
    }

    deletion_protection = var.deletion_protection

}
