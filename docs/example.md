# Example

```hcl
# Example main.tf file

module "healthcheck" {
  source        = "<URL_MODULE>"

  // Healthcheck
  name               = "healthcheck-test"
  fqdn_list          = ["healthcheck-1.marius.xyz", "healthcheck-2.marius.xyz"]
  port_list          = ["443", "443"]
  type_list          = ["HTTPS", "HTTPS"]
  resource_path_list = ["/health", "/health"]

  // DNS
  domain           = "marius.xyz."
  private_zone     = false
  routing_policy   = "failover"
  subdomain        = "app"
  primary_values   = ["app-1.prod"]
  secondary_values = ["app-2.prod"]
}

# Example output.tf file

output "healthchecks_ids" {
  value = "${module.healthcheck.healthchecks_id}"
}

output "primary_records" {
  value = "${module.healthcheck.primary_records}"
}

output "secondary_records" {
  value = "${module.healthcheck.secondary_records}"
}

output "primary_fqdn" {
  value = "${module.healthcheck.primary_fqdn}"
}

output "secondary_fqdn" {
  value = "${module.healthcheck.secondary_fqdn}"
}

```
