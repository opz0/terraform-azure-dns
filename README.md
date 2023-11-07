# terraform-azure-dns
# Terraform Azure Infrastructure

This Terraform configuration defines an Azure infrastructure using the Azure provider.

## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Module Inputs](#module-inputs)
- [Module Outputs](#module-outputs)
- [Examples](#examples)
- [License](#license)

## Introduction
This repository contains Terraform code to deploy resources on Microsoft Azure, including a resource group and a dns.

## Usage
To use this module, you should have Terraform installed and configured for AZURE. This module provides the necessary Terraform configuration
for creating AZURE resources, and you can customize the inputs as needed. Below is an example of how to use this module:

# Example

```hcl
module "dns_zone" {
  depends_on                   = [module.resource_group, module.vnet]
  source                       = "git::https://github.com/opz0/terraform-azure-dns.git?ref=v1.0.0"
  name                         = local.name
  environment                  = local.environment
  resource_group_name          = module.resource_group.resource_group_name
  dns_zone_names               = "example0000.com"
  private_registration_enabled = true
  private_dns                  = true
  private_dns_zone_name        = "webserver0000.com"
  virtual_network_id           = module.vnet.id
  a_records = [{
    name    = "test"
    ttl     = 3600
    records = ["10.0.180.17", "10.0.180.18"]
  },
    {
      name    = "test2"
      ttl     = 3600
      records = ["10.0.180.17", "10.0.180.18"]
    }]

  cname_records = [{
    name   = "test1"
    ttl    = 3600
    record = "example.com"
  }]

  ns_records = [{
    name    = "test2"
    ttl     = 3600
    records = ["ns1.example.com.", "ns2.example.com."]
  }]
}

```
This example demonstrates how to create various AZURE resources using the provided modules. Adjust the input values to suit your specific requirements.

## Module Inputs
The following input variables can be configured:

- 'name': The name of the DNS Zone. Must be a valid domain name.
- 'environment': The environment or purpose of the resources.
- 'resource_group_name': Specifies the resource group where the resource exists.
- 'dns_zone_names': The address space for the virtual network.
- 'private_registration_enabled': Is auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled?
- 'virtual_network_id':  The ID of the Virtual Network that should be linked to the DNS Zone.
- 'a_records': An soa_record block as defined below.

## Module Outputs
This module provides the following outputs:

- 'dns_zone_id': The DNS Zone ID.
- 'dns_zone_number_of_record_sets':  The number of records already in the zone.
- 'dns_zone_name_servers': A list of values that make up the NS record for the zone.
- 'dns_zone_max_number_of_record_sets': Maximum number of Records in the zone.

# Examples
For detailed examples on how to use this module, please refer to the 'examples' directory within this repository.

# License
This Terraform module is provided under the '[License Name]' License. Please see the [LICENSE](https://github.com/opz0/terraform-azure-dns/blob/readme/LICENSE) file for more details.

# Author
Your Name
Replace '[License Name]' and '[Your Name]' with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.
