variable "dataset_id" {
    type = string
    default = "testing_22366"

}

variable "friendly_name" {
    type = string
    default = "testing dataset"
}

variable "description" {
    type = string
    default = "Sample dataset"
}

variable "location" {
    type = string
    default = "US"
}

variable "project_id" {
    type = string
    default = "fluent-buckeye-335714"
}

variable "table_id" {
    type = string
    default = "testing_table1"
}

variable "source_uris" {
    type = list(string)
    default = [ "https://storage.cloud.google.com/bq-data-bucket-22366/sample.csv" ]
}

variable "source_format" {
    type = string
    default = "CSV"
}

variable "autodetect" {
    type = bool
    default = true
}

variable "deletion_protection" {
    type = bool
    default = true
}