// terraform-aws-healthcheck module
// Marius Stanca - me@marius.xyz, marius.stanca@idemia.com

terraform {
  required_version = ">= 0.11.8"
}

provider "aws" {
  version                 = ">= 2.17.0, <= 2.18.0"
  region                  = "${var.region}"
  shared_credentials_file = "${var.shared_credentials_file}"
  profile                 = "${var.profile}"
}

data "aws_route53_zone" "domain" {
  count        = "${var.domain != "" ? 1 : 0}"
  name         = "${var.domain}"
  private_zone = "${var.private_zone}"
}

resource "aws_route53_health_check" "this" {
  count             = "${var.name != "" && length(var.fqdn_list) >= 1 ? length(var.fqdn_list) : 0}"
  fqdn              = "${var.fqdn_list[count.index]}"
  port              = "${var.port_list[count.index]}"
  type              = "${var.type_list[count.index]}"
  resource_path     = "${var.resource_path_list[count.index]}"
  failure_threshold = "${var.failure_threshold}"
  request_interval  = "${var.request_interval}"

  tags = "${merge(var.tags, map("Name", length(var.fqdn_list) >= 1 ? format("%s-%d", var.name, count.index+1) : var.name))}"
}

resource "aws_route53_record" "primary" {
  count           = "${var.routing_policy == "failover" && var.domain != "" && var.subdomain != "" && length(var.primary_values) >= 1 ? 1 : 0}"
  zone_id         = "${data.aws_route53_zone.domain.zone_id}"
  name            = "${var.subdomain}"
  type            = "${var.record_type}"
  ttl             = "${var.ttl}"
  records         = ["${var.primary_values}"]
  set_identifier  = "${var.primary_set_identifier != "" ? var.primary_set_identifier : format("primary-identifier-1-%s", random_string.string.result)}"
  health_check_id = "${element(aws_route53_health_check.this.*.id, 0)}"

  failover_routing_policy = {
    type = "PRIMARY"
  }

  depends_on = ["aws_route53_health_check.this"]
}

resource "aws_route53_record" "secondary" {
  count           = "${var.routing_policy == "failover" && var.domain != "" && var.subdomain != "" && length(var.secondary_values) >= 1 ? 1 : 0}"
  zone_id         = "${data.aws_route53_zone.domain.zone_id}"
  name            = "${var.subdomain}"
  type            = "${var.record_type}"
  ttl             = "${var.ttl}"
  records         = ["${var.secondary_values}"]
  set_identifier  = "${var.secondary_set_identifier != "" ? var.secondary_set_identifier : format("secondary-identifier-2-%s", random_string.string.result)}"
  health_check_id = "${element(aws_route53_health_check.this.*.id, 1)}"

  failover_routing_policy = {
    type = "SECONDARY"
  }

  depends_on = ["aws_route53_health_check.this"]
}
