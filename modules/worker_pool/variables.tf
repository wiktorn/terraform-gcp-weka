variable "project_id" {
  type        = string
  description = "Project id"
}

variable "region" {
  type        = string
  description = "Region name"
}

variable "vpc_name" {
  type        = string
  description = "Vpc name"
  default     = ""
}

variable "prefix" {
  type        = string
  description = "Prefix for all resources"
  default     = "weka"
}

variable "worker_machine_type" {
  type        = string
  description = "Machine type of a worker"
}

variable "worker_disk_size" {
  type        = number
  description = "Size of the disk attached to the worker, in GB"
}

variable "cluster_name" {
  type        = string
  description = "Cluster prefix for all resources"
}

variable "set_worker_pool_network_peering" {
  type        = bool
  description = "Create peering between worker pool network and vpcs networks"
}

variable "worker_pool_network" {
  type        = string
  default     = ""
  description = "Network name of worker pool, Must be on the same project and region"
}

variable "sa_email" {
  type        = string
  description = "service account email"
}

variable "worker_pool_id" {
  type        = string
  default     = ""
  description = "Exiting worker pool id"
}
