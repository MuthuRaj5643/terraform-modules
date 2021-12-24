module "custom_iam_role" {
    source = "../modules/custom_iam_role"
    project = var.project
    role_id = var.role_id
    title = var.title
    description = var.description
    permissions = var.permissions
}

output "custom_role_details" {
    value = module.custom_iam_role.custom_role_details
}