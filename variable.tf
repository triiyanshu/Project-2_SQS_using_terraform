variable "region" {
  description = "The region in which to create the SQS queues and DLQs."
}

variable "tags" {
  description = "Tags to apply to the SQS queues and DLQs."
  type        = map(string)
  default = {
    Project     = "cd"
    Environment = "dev"
  }
}


