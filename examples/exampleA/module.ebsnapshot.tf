module "ebsnapshot" {
  source      = "../../"
  schedule    = var.schedule
  common_tags = var.common_tags
}
