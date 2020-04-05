//--------------------------------------------------------------------
// Variables
variable "search_service_hosting_mode" {}
variable "client_secret" {
  description = "client secret"
}

//--------------------------------------------------------------------
// Modules
module "search_service" {
  source  = "app.terraform.io/skalapa-azure/search-service/azurerm"
  version = "0.0.2"

  client_secret = "${var.client_secret}"
  hosting_mode = "${var.search_service_hosting_mode}"
  location = "southcentralus"
  partition_count = 1
  replica_count = 1
  resource_group = "tf-rg-2"
  search_name = "tfsearch"
  sku = "free"
}