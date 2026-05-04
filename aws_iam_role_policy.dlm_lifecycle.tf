resource "aws_iam_role_policy" "dlm_lifecycle" {
  # checkov:skip=CKV_AWS_290: Policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_355: Policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_272: Policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_356: Policy requires broad access for this module to function
  name   = "dlm-lifecycle-policy"
  role   = aws_iam_role.dlm_lifecycle.id
  policy = data.aws_iam_policy_document.dlm.json
}
