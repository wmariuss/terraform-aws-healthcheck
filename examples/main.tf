module "healthcheck" {
  source        = "../"

  // Healthcheck
  name               = "healthcheck"
  fqdn_list          = ["healthcheck1.marius.xyz", "healthcheck2.marius.xyz"]
  port_list          = ["443", "443"]
  type_list          = ["HTTPS", "HTTPS"]
  resource_path_list = ["/ping", "/ping"]

  // DNS
  domain           = "marius.xyz"
  private_zone     = false
  routing_policy   = "failover"
  subdomain        = "health"
  primary_values   = ["health1"]
  secondary_values = ["health2"]
}
