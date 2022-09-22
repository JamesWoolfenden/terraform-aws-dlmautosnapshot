# terraform-aws-dlmautosnapshot

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-dlmautosnapshot/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-dlmautosnapshot)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-dlmautosnapshot.svg)](https://github.com/JamesWoolfenden/terraform-aws-dlmautosnapshot/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-dlmautosnapshot.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-dlmautosnapshot/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-aws-dlmautosnapshot/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-dlmautosnapshot&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-dlmautosnapshot/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-dlmautosnapshot&benchmark=INFRASTRUCTURE+SECURITY)

Terraform module - creates ups data life-cycle management to automate ebs backups.

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

Include this repository as a module in your existing terraform code:

```terraform
module "dlmautowsnapshot" {
  source          = "JamesWoolfenden/dlmautowsnapshot/aws"
  version         = "0.2.9"
  common_tags     = var.common_tags
  snapshot_name   = local.snapshot_name
  cron_expression = var.cron_expression
  regions         = var.regions
}
```

The management of EC2 backup has become simpler With the new release of Data Lifecycle Manager (DLM) policies <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/snapshot-lifecycle.html>.
There is no more need for a Lambdas to manage EBS snapshots, and additionally with the new release of support for DLM in Terraform <https://www.terraform.io/docs/providers/aws/r/dlm_lifecycle_policy.html> it can achieved easily.

The example - exampleA shows how to implement a DLM policy on EBS snapshots.
As before you include a reference to the module in your code.

In the example the variable schedule is an extensible list of maps.

```JSON
  schedule = [{
      name = "2 weeks of daily snapshots"
      create_rule=[{
        interval      = 24
        interval_unit = "HOURS"
        times         = ["23:45"]
      }]

      retain_rule=[{
        count = 14
      }]

      tags_to_add {
        SnapshotCreator = "DLM"
      }

      copy_tags = false
    }
]
```

That's all for now.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.31.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_dlm_lifecycle_policy.lifecycle](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dlm_lifecycle_policy) | resource |
| [aws_iam_role.dlm_lifecycle](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.dlm_lifecycle](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_policy_document.dlm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.trust](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Implements the common tags scheme | `map(any)` | n/a | yes |
| <a name="input_schedule"></a> [schedule](#input\_schedule) | The DLM Schedule | `list(any)` | n/a | yes |
| <a name="input_schedule_copy_tags"></a> [schedule\_copy\_tags](#input\_schedule\_copy\_tags) | n/a | `bool` | `false` | no |
| <a name="input_schedule_interval"></a> [schedule\_interval](#input\_schedule\_interval) | Interval between | `number` | `24` | no |
| <a name="input_schedule_interval_unit"></a> [schedule\_interval\_unit](#input\_schedule\_interval\_unit) | Schedile Interval Unit | `string` | `"HOURS"` | no |
| <a name="input_schedule_name"></a> [schedule\_name](#input\_schedule\_name) | Name of the Schedule | `string` | `"2 weeks of daily snapshots"` | no |
| <a name="input_schedule_retain"></a> [schedule\_retain](#input\_schedule\_retain) | n/a | `number` | `14` | no |
| <a name="input_schedule_times"></a> [schedule\_times](#input\_schedule\_times) | When the policy should run | `string` | `"23:45"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lifecycle"></a> [lifecycle](#output\_lifecycle) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Policy

This is the policy required to build this project:

<!-- BEGINNING OF PRE-COMMIT-PIKE DOCS HOOK -->
The Terraform resource required is:

```golang
resource "aws_iam_policy" "terraform_pike" {
  name_prefix = "terraform_pike"
  path        = "/"
  description = "Pike Autogenerated policy from IAC"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "iam:CreateRole",
                "iam:DeleteRole",
                "iam:DeleteRolePolicy",
                "iam:GetRole",
                "iam:GetRolePolicy",
                "iam:ListAttachedRolePolicies",
                "iam:ListInstanceProfilesForRole",
                "iam:ListRolePolicies",
                "iam:PutRolePolicy",
                "iam:TagRole"
            ],
            "Resource": "*"
        }
    ]
})
}


```
<!-- END OF PRE-COMMIT-PIKE DOCS HOOK -->

## Related Projects

Check out these related projects.

- [terraform-aws-s3](https://github.com/jameswoolfenden/terraform-aws-s3) - S3 buckets

## Help

**Got a question?**

File a GitHub [issue](https://github.com/JamesWoolfenden/terraform-aws-dlmautowsnapshot/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/JamesWoolfenden/terraform-aws-dlmautowsnapshot/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2022 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
