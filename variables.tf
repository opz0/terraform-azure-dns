
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] ."
}

variable "managedby" {
  type        = string
  default     = "info@cypik.com"
  description = "ManagedBy, eg 'info@cypik.com'"
}

variable "repository" {
  type        = string
  default     = "https://github.com/cypik/terraform-azure-dns"
  description = "Terraform current module repo"
}

variable "extra_tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)."
}

variable "dns_zone_names" {
  default     = null
  type        = string
  description = "The public dns zone to be created for internal vnet resolution"

}

variable "private_dns_zone_name" {
  default     = null
  type        = string
  description = "The private dns zone to be created for internal vnet resolution"
}

variable "resource_group_name" {
  type        = string
  default     = ""
  description = "The name of the resource group where the Azure DNS resides"
}

variable "private_registration_enabled" {
  default     = true
  type        = bool
  description = "Is auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled?"
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Flag to enable or disable the resource. When set to true, the resource will be created."
}

variable "enabled_dns" {
  type        = bool
  default     = true
  description = "Flag to enable or disable DNS settings for the resource."
}

variable "private_dns" {
  type        = bool
  default     = false
  description = "Flag to specify whether private DNS should be enabled. When set to true, private DNS will be used."
}


variable "virtual_network_id" {
  type        = string
  default     = ""
  description = "The name of the virtual network"
}

variable "soa_record" {
  type        = list(any)
  default     = []
  description = "Customize details about the root block device of the instance. See Block Devices below for details."
}

variable "soa_record_private_dns" {
  type        = list(any)
  default     = []
  description = "Customize details about the root block device of the instance. See Block Devices below for details."
}

variable "a_records" {
  type        = any
  default     = []
  description = "List of a records to be added in azure dns zone."
}

variable "cname_records" {
  type        = any
  default     = []
  description = "List of cname records"
}

variable "ns_records" {
  type = list(object({
    name    = string,      #(Required) The name of the DNS NS Record. Changing this forces a new resource to be created.
    ttl     = number,      # (Required) The Time To Live (TTL) of the DNS record in seconds.
    records = list(string) #(Required) A list of values that make up the NS record.
  }))
  default     = []
  description = "List of ns records"
}
