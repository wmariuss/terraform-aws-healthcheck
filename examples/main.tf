module "healthcheck" {
  source        = "../"
  profile       = "488687845015"

  // Healthcheck
  name               = "epay-healthcheck"
  fqdn_list          = ["healthcheck-cloud-01.staging.oberthur.net", "healthcheck-cloud-02.staging.oberthur.net"]
  port_list          = ["443", "443"]
  type_list          = ["HTTPS", "HTTPS"]
  resource_path_list = ["/epay", "/epay"]

  // DNS
  domain           = "dsa.idemia.io."
  private_zone     = false
  routing_policy   = "failover"
  subdomain        = "corsica-tsm-cloud"
  primary_values   = ["corsica-tsm-cloud-01"]
  secondary_values = ["corsica-tsm-cloud-02"]
}
