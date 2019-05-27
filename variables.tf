variable "schedule" {
  description = "The DLM Schedule"
  type        = list
}

variable "region" {

  description = "AWS region"
  default     = "eu-west-1"
  type        = string
}

variable "schedule_name" {
  default = "2 weeks of daily snapshots"
}

variable "schedule_interval" {
  type    = number
  default = 24
}

variable "schedule_interval_unit" {
  default = "HOURS"
}

variable "schedule_times" {
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
  type = map
}
