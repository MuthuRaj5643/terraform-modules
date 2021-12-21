variable "dataset_id" {
    type = string

}

variable "friendly_name" {
    type = string
}

variable "description" {
    type = string
}

variable "location" {
    type = string
}

variable "project_id" {
    type = string
}

variable "table_id" {
    type = string
}

variable "source_uris" {
    type = list(string)   
}

variable "source_format" {
    type = string
}

variable "autodetect" {
    type = bool
}

variable "deletion_protection" {
    type = bool
}