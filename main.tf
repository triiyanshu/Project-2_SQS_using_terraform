# main.tf

# Define the SQS queue names
variable "sqs_queue_names" {
  type = map(string)
  default = {
    "dev"  = "cd-dev-issue-package-builder-queue"
    "uat"  = "cd-uat-issue-package-builder-queue"
    "live" = "cd-live-issue-package-builder-queue"
  }
}

# Define the DLQ names
variable "dlq_names" {
  type = map(string)
  default = {
    "dev"  = "cd-dev-issue-package-builder-dlq"
    "uat"  = "cd-uat-issue-package-builder-dlq"
    "live" = "cd-live-issue-package-builder-dlq"
  }
}

# Define the tags for the resources
variable "tags" {
  type = map(string)
  default = {
    "Project"     = "cd"
    "Environment" = "dev"
  }
}

# Create the SQS queues and DLQs
resource "aws_sqs_queue" "sqs_queues" {
  for_each = var.sqs_queue_names

  name                      = each.value
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 345600
  receive_wait_time_seconds = 20

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq_queues[each.key].arn
    maxReceiveCount     = 10
  })

  tags = merge(var.tags, {
    "Name" = each.value
  })
}

resource "aws_sqs_queue" "dlq_queues" {
  for_each = var.dlq_names

  name                      = each.value
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 345600
  receive_wait_time_seconds = 20

  tags = merge(var.tags, {
    "Name" = each.value
  })
}
