# Terraform-aws-dlmautosnapshot

With the new release of Data Lifecycle Manager (DLM) policies https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/snapshot-lifecycle.html , this means there is no more need for a Lambda to manage EBS snapshots, additionally with the new release of support for DLM in Terraform https://www.terraform.io/docs/providers/aws/r/dlm_lifecycle_policy.html it can be done quite easily.

exampleA shows how to implement a DLM policy on EBS snapshots.
Include a reference to the module in your code:

~~~ HCL
module "ebsnapshot" {
  source   = "../../"
  schedule = "${var.schedule}"
}
~~~

Where the variable schedule is an extensible  list of maps, as seen in the terraform tfvars of the example.

~~~ JSON
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
~~~

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| schedule |  | list | - | yes |
�