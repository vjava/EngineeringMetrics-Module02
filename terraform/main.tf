resource "databricks_schema" "landing" {
  catalog_name = var.catalog_name
  name         = "landing"
}

resource "databricks_volume" "landing" {
  catalog_name = var.catalog_name
  schema_name  = databricks_schema.landing.name

  name        = "landing_files"
  volume_type = "MANAGED"
}

resource "databricks_directory" "workspace" {
  path = "/Shared/EngineeringMetrics/Module02"
}

resource "databricks_notebook" "pipeline" {
  path           = "/Shared/EngineeringMetrics/Module02/employee_pipeline"
  language       = "PYTHON"
  content_base64 = base64encode(file("${path.module}/../notebooks/01_employee_pipeline.py"))
}

output "schema_name" {
  value = databricks_schema.landing.name
}

output "volume_name" {
  value = databricks_volume.landing.name
}

output "workspace_folder" {
  value = databricks_directory.workspace.path
}