// Output
output "healthchecks_id" {
  value = "${aws_route53_health_check.this.*.id}"
}

output "primary_records" {
  value = "${aws_route53_record.primary.*.name}"
}

output "secondary_records" {
  value = "${aws_route53_record.secondary.*.name}"
}

output "primary_fqdn" {
  value = "${aws_route53_record.primary.*.fqdn}"
}

output "secondary_fqdn" {
  value = "${aws_route53_record.secondary.*.fqdn}"
}
