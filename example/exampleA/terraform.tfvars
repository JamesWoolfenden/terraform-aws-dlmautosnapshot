schedule = [{
  name = "2 weeks of daily snapshots"
  create_rule = [{
    interval      = 24
    interval_unit = "HOURS"
    times         = ["23:45"]
  }]

  retain_rule = [{
    count = 14
  }]

  tags_to_add = {
    SnapshotCreator = "DLM"
  }

  copy_tags = false
  }
]

common_tags = {
  name = "DLM"
}
