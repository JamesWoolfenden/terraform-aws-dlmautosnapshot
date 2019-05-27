resource "aws_iam_role" "dlm_lifecycle" {
  name = "dlm-lifecycle-role"

  assume_role_policy = data.aws_iam_policy_document.trust.json
  tags               = var.common_tags
}
