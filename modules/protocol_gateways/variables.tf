variable "project_id" {
  type        = string
  description = "Project id"
}

variable "zone" {
  type        = string
  description = "Zone name"
}

variable "machine_type" {
  type        = string
  description = "Weka cluster backends machines type"
  default     = "c2-standard-8"
  validation {
    condition     = contains(["c2-standard-8", "c2-standard-16"], var.machine_type)
    error_message = "Machine type isn't supported"
  }
}

variable "region" {
  type        = string
  description = "Region name"
}

variable "protocol" {
  type        = string
  description = "Name of the protocol."
  default     = "NFS"

  validation {
    condition     = contains(["NFS", "SMB"], var.protocol)
    error_message = "Allowed values for protocol: NFS, SMB."
  }
}

variable "secondary_ips_per_nic" {
  type        = number
  description = "Number of secondary IPs per single NIC per protocol gateway virtual machine."
  default     = 2
}

variable "subnets_list" {
  type        = list(string)
  description = "list of subnet names"
}

variable "yum_repo_server" {
  type        = string
  description = "yum repo server address"
  default     = ""
}

variable "gateways_number" {
  type        = number
  description = "The number of virtual machines to deploy as protocol gateways."
}

variable "gateways_name" {
  type        = string
  description = "The protocol group name."
}

variable "interface_group_name" {
  type        = string
  description = "Interface group name."
  default     = "weka-ig"

  validation {
    condition     = length(var.interface_group_name) <= 11
    error_message = "The interface group name should be up to 11 characters long."
  }
}

variable "client_group_name" {
  type        = string
  description = "Client access group name."
  default     = "weka-cg"
}

variable "assign_public_ip" {
  type        = bool
  description = "Determines whether to assign public ip."
}

variable "disk_size" {
  type        = number
  description = "The disk size."
}

variable "traces_per_frontend" {
  default     = 10
  type        = number
  description = "The number of traces per frontend ionode. Traces are low-level events generated by Weka processes and are used as troubleshooting information for support purposes. Protocol gateways have only frontend ionodes."
}

variable "frontend_cores_num" {
  type        = number
  default     = 1
  description = "The number of frontend ionodes per instance."

  validation {
    condition     = var.frontend_cores_num >= 1
    error_message = "The number of frontend ionodes per GW instance must be at least 1."
  }
}

variable "install_weka_url" {
  type        = string
  description = "The URL of the Weka release download tar file."

  validation {
    condition     = length(var.install_weka_url) > 0
    error_message = "The URL should not be empty."
  }
}

variable "sa_email" {
  type        = string
  description = "service account email"
}

variable "backend_lb_ip" {
  type        = string
  description = "Backend Load balance private ip"
}

variable "source_image_id" {
  type        = string
  description = "Source image id"
}

variable "weka_token_id" {
  type        = string
  description = "Id of weka token"
}

variable "weka_password_id" {
  type        = string
  description = "Id of weka password"
}

variable "proxy_url" {
  type        = string
  description = "Weka home proxy url"
  default     = ""
}


variable "setup_protocol" {
  type        = bool
  description = "Configure protocol, default value is False"
}

variable "smbw_enabled" {
  type        = bool
  default     = false
  description = "Enable SMBW protocol."
}

variable "smb_cluster_name" {
  type        = string
  description = "The name of the SMB setup."
  default     = "Weka-SMB"
  validation {
    condition     = length(var.smb_cluster_name) > 0 && length(var.smb_cluster_name) <= 15
    error_message = "The SMB cluster name should be less than 15 characters long."
  }
}

variable "smb_domain_name" {
  type        = string
  description = "The domain to join the SMB cluster to."
  default     = ""
}

variable "smb_domain_netbios_name" {
  type        = string
  description = "The domain NetBIOS name of the SMB cluster."
  default     = ""
}

variable "smb_dns_ip_address" {
  type        = string
  description = "DNS IP address"
  default     = ""
}

variable "smb_share_name" {
  type        = string
  description = "The name of the SMB share"
  default     = ""
}
