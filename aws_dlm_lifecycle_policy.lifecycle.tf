resource "aws_dlm_lifecycle_policy" "lifecycle" {
  description        = "DLM lifecycle policy"
  execution_role_arn = aws_iam_role.dlm_lifecycle.arn
  state              = "ENABLED"

  policy_details {
    resource_types = ["VOLUME"]

    schedule {
      name = var.schedule_name
      create_rule {
        interval      = var.schedule_interval
        interval_unit = var.schedule_interval_unit
        times         = [var.schedule_times]
      }

      retain_rule {
        count = var.schedule_retain
      }

      tags_to_add = {
        SnapshotCreator = "DLM"
      }

      copy_tags = var.schedule_copy_tags
    }

    target_tags = {
      Snapshot = "true"
    }
  }
}
