resource "aws_dlm_lifecycle_policy" "lifecycle" {
  description        = "DLM lifecycle policy"
  execution_role_arn = "${aws_iam_role.dlm_lifecycle.arn}"
  state              = "ENABLED"

  policy_details {
    resource_types = ["VOLUME"]

    schedule = "${var.schedule}"

    target_tags {
      Snapshot = "true"
    }
  }
}
