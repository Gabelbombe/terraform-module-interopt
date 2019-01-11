#### Description of AWS account

```bash
bash-4.4$ aws --profile GEHC-030 route53 list-hosted-zones
Enter MFA code for arn:aws:iam::772660252183:mfa/503072343:
{
    "HostedZones": [
        {
            "Id": "/hostedzone/Z1D0R4Y5FZMR4C",
            "Name": "test-zone.",
            "CallerReference": "7574B610-7D09-7BEE-AACB-295BFD9264BD",
            "Config": {
                "PrivateZone": true
            },
            "ResourceRecordSetCount": 3
        }
    ]
}
```

#### Description of error

```bash
bash-4.4$ aws-vault exec GEHC-030  --assume-role-ttl=60m -- terraform plan -var 'cloud_provider=aws' -var 'domain_name_zone=test-zone.' -var 'domain_name_record=test-record.test-zone.'
var.domain_name_target
  Enter a value: foo

provider.aws.region
  The region where AWS operations will take place. Examples
  are us-east-1, us-west-2, etc.

  Default: us-east-1
  Enter a value:

Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

data.aws_route53_zone.selected: Refreshing state...

Error: Error refreshing state: 1 error(s) occurred:

* module.dns.module.aws_dns_record.data.aws_route53_zone.selected: 1 error(s) occurred:

* module.dns.module.aws_dns_record.data.aws_route53_zone.selected: data.aws_route53_zone.selected: no matching Route53Zone found
```
