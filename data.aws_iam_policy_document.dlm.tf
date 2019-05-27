
data "aws_iam_policy_document" "dlm" {
  statement {
    actions = [
      "ec2:CreateTags",
    ]

    resources = ["arn:aws:ec2:*::snapshot/*"]
  }

  statement {
    actions = [
      "ec2:CreateSnapshot",
      "ec2:DeleteSnapshot",
      "ec2:DescribeVolumes",
      "ec2:DescribeSnapshots",
    ]

    resources = ["*"]
  }
}
