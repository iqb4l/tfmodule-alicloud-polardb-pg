output "cluster_id" {
  value = alicloud_polardb_cluster.cluster.id
}

output "cluster_connection_string" {
  value = alicloud_polardb_cluster.cluster.connection_string
}

output "ro_endpoint_connection_string" {
  value = var.create_ro_endpoint && var.readonly_nodes > 0 ? alicloud_polardb_cluster_endpoint.ro_endpoint[0].connection_string : null
}