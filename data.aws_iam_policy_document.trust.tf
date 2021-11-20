
data "aws_iam_policy_document" "trust" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["dlm.amazonaws.com"]
    }
  }
}
