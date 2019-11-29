variable "schedule" {
  description = "The DLM Schedule"
  type        = list
}

variable "schedule_name" {
  description="Name of the Schedule"
  default = "2 weeks of daily snapshots"
}

variable "schedule_interval" {
  description="Interval between"
  type    = number
  default = 24
}

variable "schedule_interval_unit" {
  description="Schedile Interval Unit"
  type=string
  default = "HOURS"
}

variable "schedule_times" {
  description="When the policy should run"
  type=string
  default = "23:45"
}

variable "schedule_retain" {
  type    = number
  default = 14
}

variable "schedule_copy_tags" {
  default = false
}

variable "common_tags" {
  description="Implements the common tags scheme"
  type = map
}
