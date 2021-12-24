resource "google_project_iam_custom_role" "custom_role" {
    # project = var.project
    role_id = var.role_id
    title = var.title
    description = var.description
    permissions = var.permissions     
}

resource "google_service_account" "sa" {
    account_id = var.account_id
    display_name = var.display_name
}

resource "google_service_account_iam_member" "sa_iam" {
    service_account_id = google_service_account.sa.name
    role = google_project_iam_custom_role.custom_role.name
    member = "serviceAccount:${google_service_account.sa.email}"
    depends_on = [ google_project_iam_custom_role.custom_role, google_service_account.sa ] 
}