
data "aws_iam_policy_document" "trust" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "service"
      identifiers = ["dlm.amazonaws.com"]
    }
  }
}
