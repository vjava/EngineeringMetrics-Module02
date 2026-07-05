variable "workspace_url" {
  type = string
}

variable "token" {
  type      = string
  sensitive = true
}

variable "catalog_name" {
  type    = string
  default = "engmetrics"
}

provider "databricks" {
  host  = var.workspace_url
  token = var.token
}