# Parameters

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| domain | This is the name of the hosted zone | string | `""` | yes |
| failure\_threshold | The number of consecutive health checks that an endpoint must pass or fail | string | `"5"` | no |
| fqdn\_list | The fully qualified domain name of the endpoint to be checked | list | `<list>` | yes |
| name | Give a name for the healthcheck | string | `""` | no |
| port\_list | The port of the endpoint to be checked. | list | `<list>` | yes |
| primary\_set\_identifier | Unique identifier to differentiate records with routing policies from one another -  primary | string | `""` | no |
| primary\_values | List of records for primary failover routing policy | list | `<list>` | yes |
| private\_zone | Set true if the zone is private | string | `"true"` | no |
| profile | Specify the profile to apply write AWS credentials | string | `"default"` | no |
| record\_type | The record type. Valid values are A, AAAA, CAA, CNAME, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT | string | `"CNAME"` | no |
| region | Region you want to deploy AWS resources | string | `"us-east-1"` | no |
| request\_interval | The number of seconds between the time that Amazon Route 53 gets a response from your endpoint and the time that it sends the next health-check request | string | `"30"` | no |
| resource\_path\_list | The path list that you want Amazon Route 53 to request when performing health checks | list | `<list>` | no |
| routing\_policy | Type of failover routing policy | string | `"simple"` | no |
| secondary\_set\_identifier | Unique identifier to differentiate records with routing policies from one another - secondary | string | `""` | no |
| secondary\_values | List of records for secondary failover routing policy | list | `<list>` | yes |
| shared\_credentials\_file | File that contains AWS credentials | string | `"~/.aws/credentials"` | no |
| subdomain | The name of the record | string | `""` | yes |
| tags | A map of tags to add to healthcheck | map | `<map>` | no |
| ttl | The TTL of the record | string | `"300"` | no |
| type\_list | The protocol to use when performing health checks. Valid values are HTTP, HTTPS, HTTP_STR_MATCH, HTTPS_STR_MATCH, TCP, CALCULATED and CLOUDWATCH_METRIC | list | `<list>` | yes |

## Outputs

| Name | Description |
|------|-------------|
| healthchecks\_id | Output |
| primary\_fqdn |  |
| primary\_records |  |
| secondary\_fqdn |  |
| secondary\_records |  |
