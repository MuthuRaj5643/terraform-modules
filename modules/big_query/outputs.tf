output "dataset_details" {
    value = google_bigquery_dataset.sample
    description = "deatils of table creation"
}

output "table_details" {
    value = google_bigquery_table.default
    description = "details of the table created"
}