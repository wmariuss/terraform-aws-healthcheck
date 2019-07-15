variable "region" {
  description = "Region you want to deploy AWS resources"
  default     = "us-east-1"
}

variable "shared_credentials_file" {
  description = "File that contains AWS credentials"
  default     = "~/.aws/credentials"
}

variable "profile" {
  description = "Specify the profile to apply write AWS credentials"
  default     = "default"
}

variable "name" {
  description = "Give a name for the healthcheck"
  default     = ""
}

variable "fqdn_list" {
    type        = "list"
    description = "The fully qualified domain name of the endpoint to be checked"
    default     = []
}

variable "port_list" {
  type        = "list"
  description = "The port of the endpoint to be checked."
  default     = []
}

variable "type_list" {
  type        = "list"
  description = "The protocol to use when performing health checks. Valid values are HTTP, HTTPS, HTTP_STR_MATCH, HTTPS_STR_MATCH, TCP, CALCULATED and CLOUDWATCH_METRIC"
  default     = []
}

variable "resource_path_list" {
  type        = "list"
  description = "The path list that you want Amazon Route 53 to request when performing health checks"
  default     = []
}


variable "failure_threshold" {
  description = "The number of consecutive health checks that an endpoint must pass or fail"
  default     = 5
}

variable "request_interval" {
  description = "The number of seconds between the time that Amazon Route 53 gets a response from your endpoint and the time that it sends the next health-check request"
  default     = 30
}

variable "tags" {
  description = "A map of tags to add to healthcheck"
  default     = {}
}

variable "domain" {
  description = "This is the name of the hosted zone"
  default     = ""
}

variable "private_zone" {
  description = "Set true if the zone is private"
  default     = true
}

variable "subdomain" {
  description = "The name of the record"
  default     = ""
}

variable "record_type" {
  description = "The record type. Valid values are A, AAAA, CAA, CNAME, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT"
  default     = "CNAME"
}

variable "ttl" {
  description = "The TTL of the record"
  default     = 300
}

variable "primary_values" {
  description = "List of records for primary failover routing policy"
  default     = []
}

variable "secondary_values" {
  description = "List of records for secondary failover routing policy"
  default     = []
}

variable "routing_policy" {
  description =  "Type of failover routing policy"
  default     = "simple"
}

variable "primary_set_identifier" {
  description = "Unique identifier to differentiate records with routing policies from one another -  primary"
  default     = ""
}

variable "secondary_set_identifier" {
  description = "Unique identifier to differentiate records with routing policies from one another - secondary"
  default     = ""
}
