variable "project" {
    type = string
    default = ""
}

variable "role_id" {
    type = string
    default = "myRole"
}

variable "title" {
    type = string
    default = "a custome role"
}

variable "description" {
    type = string
    default = "a custome role for sa"
}

variable "permissions" {
    type = list(string)
    default = ["appengine.applications.create"]
}

variable "account_id" {
    type = string
    default = "terra-sa"
}

variable "display_name" {
    type = string
    default = "testing service account"
}