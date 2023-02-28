variable "tags" {
  description = "Tags to apply to the SQS queues and DLQs."
  type        = map(string)
  default     = {
    Project     = "cd"
    Environment = "dev"
  }
}

variable "sqs_queue_names" {
  description = "A map of names to use for the SQS queues."
  type        = map(string)
}

# variable "dlq_names" {
#   description = "A map of names to use for the DLQs associated with the SQS queues."
#   type        = map(string)
# }

variable "dlq_names" {
  description = "Names for the associated dead letter queues."
  type        = map(string)
  default     = {
    dev  = "cd-dev-issue-package-builder-dlq"
    uat  = "cd-uat-issue-package-builder-dlq"
    live = "cd-live-issue-package-builder-dlq"
  }
}