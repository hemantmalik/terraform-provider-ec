# Retrieve the latest stack pack version
data "ec_stack" "latest" {
  version_regex = "latest"
  region        = var.region
}

# Create an Elastic Cloud deployment
resource "ec_deployment" "deployment" {
  # Optional name.
  name = "elasticsearch_deployment"

  # Mandatory fields.
  region                 = var.region
  version                = data.ec_stack.latest.version
  deployment_template_id = "azure-storage-optimized"
  traffic_filter         = [ec_deployment_traffic_filter.allow_my_instance.id]

  # Note the deployment will contain Elasticsearch and Kibana resources with default configurations.
  elasticsearch {}
  kibana {}
}

# Create a traffic filter to allow the instance's public IP address to access our deployment.
# This can also be done using a VPC private link connection.
resource "ec_deployment_traffic_filter" "allow_my_instance" {
  name   = format("Allow %s", azurerm_linux_virtual_machine.vm_instance.name)
  region = var.region
  type   = "ip"

  rule {
    # Render the IP address with an additional /32 for full CIDR address.
    source = format("%s/32", azurerm_linux_virtual_machine.vm_instance.public_ip_address)
  }
}
