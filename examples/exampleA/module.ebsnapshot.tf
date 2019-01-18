module "ebsnapshot" {
  source   = "github.com/JamesWoolfenden/terraform-aws-dlmautosnapshot"
  schedule = "${var.schedule}"
}
