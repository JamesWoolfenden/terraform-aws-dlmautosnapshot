[![Slalom][logo]](https://slalom.com)

# terraform-aws-dlmautosnapshot

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-dlmautosnapshot/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-dlmautosnapshot)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-dlmautosnapshot.svg)](https://github.com/JamesWoolfenden/terraform-aws-dlmautosnapshot/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![pre-commit](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)

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
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| common\_tags | Implements the common tags scheme | `map` | n/a | yes |
| schedule | The DLM Schedule | `list` | n/a | yes |
| schedule\_copy\_tags | n/a | `bool` | `false` | no |
| schedule\_interval | Interval between | `number` | `24` | no |
| schedule\_interval\_unit | Schedile Interval Unit | `string` | `"HOURS"` | no |
| schedule\_name | Name of the Schedule | `string` | `"2 weeks of daily snapshots"` | no |
| schedule\_retain | n/a | `number` | `14` | no |
| schedule\_times | When the policy should run | `string` | `"23:45"` | no |

## Outputs

| Name | Description |
|------|-------------|
| lifecycle | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

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

Copyright © 2019-2020 [Slalom, LLC](https://slalom.com)

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

  [![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

  [jameswoolfenden_homepage]: https://github.com/jameswoolfenden
  [jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150

[logo]: https://gist.githubusercontent.com/JamesWoolfenden/5c457434351e9fe732ca22b78fdd7d5e/raw/15933294ae2b00f5dba6557d2be88f4b4da21201/slalom-logo.png
[website]: https://slalom.com
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden

[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-dlmautowsnapshot&url=https://github.com/JamesWoolfenden/terraform-aws-dlmautowsnapshot
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-dlmautowsnapshot&url=https://github.com/JamesWoolfenden/terraform-aws-dlmautowsnapshot
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-dlmautowsnapshot
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-dlmautowsnapshot
[share_email]: mailto:?subject=terraform-aws-dlmautowsnapshot&body=https://github.com/JamesWoolfenden/terraform-aws-dlmautowsnapshot
