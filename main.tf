# Create PolarDB Cluster
resource "alicloud_polardb_cluster" "cluster" {
  description         = var.cluster_name
  db_type             = "PostgreSQL"
  db_version          = var.db_version
  pay_type            = var.pay_type
  db_node_class       = var.db_node_class
  db_node_count       = var.primary_nodes + var.readonly_nodes
  vpc_id              = var.vpc_id
  vswitch_id          = var.vswitch_id
  zone_id             = var.zone_id
  standby_az          = var.standby_az
  hot_standby_cluster = var.hot_standby_cluster
  storage_type        = var.storage_type
  security_ips        = var.security_ips
  maintain_time       = var.maintain_time
  
  db_cluster_ip_array {
    db_cluster_ip_array_name = "default"
    security_ips             = concat(["127.0.0.1"], var.security_ips)
  }
}

# Create read-only endpoint if needed
resource "alicloud_polardb_cluster_endpoint" "ro_endpoint" {
  count           = var.readonly_nodes > 0 && var.create_ro_endpoint ? 1 : 0
  db_cluster_id   = alicloud_polardb_cluster.cluster.id
  read_write_mode = "ReadOnly"
}

# Create database
resource "alicloud_polardb_database" "database" {
  count         = var.create_database ? 1 : 0
  db_cluster_id = alicloud_polardb_cluster.cluster.id
  db_name       = var.database_name
  character_set = var.character_set
}

# Create account
resource "alicloud_polardb_account" "account" {
  count              = var.create_account ? 1 : 0
  db_cluster_id      = alicloud_polardb_cluster.cluster.id
  account_name       = var.account_name
  account_password   = var.account_password
  account_type       = var.account_type
  account_description = var.account_description
}

# Grant privileges
resource "alicloud_polardb_account_privilege" "privilege" {
  count               = var.create_account && var.create_database ? 1 : 0
  db_cluster_id       = alicloud_polardb_cluster.cluster.id
  account_name        = alicloud_polardb_account.account[0].account_name
  db_names            = [alicloud_polardb_database.database[0].db_name]
  account_privilege   = var.account_privilege
}