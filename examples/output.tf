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
