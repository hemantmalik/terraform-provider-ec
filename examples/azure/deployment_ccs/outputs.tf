output "deployment_id" {
  value = ec_deployment.second_source.id
}

output "elasticsearch_version" {
  value = ec_deployment.second_source.version
}

output "elasticsearch_cloud_id" {
  value = ec_deployment.second_source.elasticsearch[0].cloud_id
}

output "elasticsearch_https_endpoint" {
  value = ec_deployment.second_source.elasticsearch[0].https_endpoint
}

output "elasticsearch_username" {
  value = ec_deployment.second_source.elasticsearch_username
}

output "elasticsearch_password" {
  value = ec_deployment.second_source.elasticsearch_password
  sensitive = true
}
