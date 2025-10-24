variable "alicloud_provider" {
    type = string
}

variable "cluster_name" {
  type        = string
  description = "Name/description of the PolarDB cluster"
}

variable "db_version" {
  type        = string
  description = "Database version"
  default     = "15"
}

variable "pay_type" {
  type        = string
  description = "Payment type"
  default     = "PostPaid"
}

variable "db_node_class" {
  type        = string
  description = "Node class for the database"
}

variable "primary_nodes" {
  type        = number
  description = "Number of primary nodes"
  default     = 1
}

variable "readonly_nodes" {
  type        = number
  description = "Number of read-only nodes"
  default     = 0
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "vswitch_id" {
  type        = string
  description = "VSwitch ID"
}

variable "zone_id" {
  type        = string
  description = "Primary zone ID"
}

variable "standby_az" {
  type        = string
  description = "Standby availability zone"
  default     = ""
}

variable "hot_standby_cluster" {
  type        = string
  description = "Hot standby cluster setting"
  default     = "ON"
}

variable "storage_type" {
  type        = string
  description = "Storage type"
  default     = "PSL4"
}

variable "security_ips" {
  type        = list(string)
  description = "Security IP list"
  default     = []
}

variable "maintain_time" {
  type        = string
  description = "Maintenance window"
  default     = "18:00Z-19:00Z"
}

variable "create_ro_endpoint" {
  type        = bool
  description = "Whether to create read-only endpoint"
  default     = false
}

variable "create_database" {
  type        = bool
  description = "Whether to create a database"
  default     = false
}

variable "database_name" {
  type        = string
  description = "Database name"
  default     = "pgdb"
}

variable "character_set" {
  type        = string
  description = "Character set for the database"
  default     = "UTF8"
}

variable "create_account" {
  type        = bool
  description = "Whether to create a database account"
  default     = false
}

variable "account_name" {
  type        = string
  description = "Database account name"
  default     = "dbadmin"
}

variable "account_password" {
  type        = string
  description = "Database account password"
  sensitive   = true
  default     = ""
}

variable "account_type" {
  type        = string
  description = "Account type"
  default     = "Super"
}

variable "account_description" {
  type        = string
  description = "Account description"
  default     = "Database administrator account"
}

variable "account_privilege" {
  type        = string
  description = "Account privilege"
  default     = "ReadWrite"
}