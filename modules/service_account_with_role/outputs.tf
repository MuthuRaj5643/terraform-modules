output "role_details" {
    value = google_project_iam_custom_role.custom_role
    description = "Details of the role "
}

output "sa_details" {
    value = google_service_account.sa
    description = "Details of the service account"
}