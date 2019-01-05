
resource "aws_dlm_lifecycle_policy" "lifecycle" {
  description        = "DLM lifecycle policy"
  execution_role_arn = "${aws_iam_role.dlm_lifecycle.arn}"
  state              = "ENABLED"

  policy_details {
    resource_types = ["VOLUME"]

    schedule {
      name = "2 weeks of daily snapshots"

      create_rule {
        interval      = 24
        interval_unit = "HOURS"
        times         = ["23:45"]
      }

      retain_rule {
        count = 14
      }

      tags_to_add {
        SnapshotCreator = "DLM"
      }

      copy_tags = false
    }

    target_tags {
      Snapshot = "true"
    }
  }
}
