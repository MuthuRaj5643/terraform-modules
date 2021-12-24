module "service_account" {
    source = "../modules/service_account_with_role"
    project = var.project
    role_id = var.role_id
    title = var.title
    description = var.description
    permissions = var.permissions
    account_id = var.account_id
    display_name = var.display_name
}
