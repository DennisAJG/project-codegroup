module "modulo_apps_network" {
  source = "../../NETWORK"

  aws_default_region                                  = var.aws_default_region
  #project_codegroup_apps_name                         = var.project_codegroup_apps_name
  #environment_codegroup_apps                          = var.environment_codegroup_apps
} 