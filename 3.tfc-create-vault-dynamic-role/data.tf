data "terraform_remote_state" "vault_admin" {
  backend = "remote"

  config = {
    organization = "ars_SecureInfraProject"
    workspaces = {
      name = "ars_SecureInfraProject"
    }
  }
}


data "vault_aws_access_credentials" "master_iamadmin_creds" {
  backend = vault_aws_secret_backend.aws.path
  role    = vault_aws_secret_backend_role.iam_admin_dynamic_role.name
}