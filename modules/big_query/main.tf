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


  schema = <<EOF
[
  {
    "name": "firstname",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "first name"
  },
  {
    "name": "lastname",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "last name"
  },
  {
    "name": "salary" ,
    "type": "INTEGER" ,
    "mode": "NULLABLE" ,
    "description": "salary of an individual"
  }
]
EOF

    external_data_configuration{
        autodetect = var.autodetect
        source_format = var.source_format
        source_uris = var.source_uris
    }

    deletion_protection = var.deletion_protection

}
