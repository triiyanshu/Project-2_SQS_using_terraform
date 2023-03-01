provider "aws" {
  region = var.region
}

# Create SQS queues and associated dead letter queues
module "sqs_queues" {
  source = "./modules/sqs_queues"

  # sqs_queue_names = var.sqs_queue_names
  # dlq_names = var.dlq_names

  # tags = var.tags
}

# Output the ARNs of the created queues
output "sqs_queue_arns" {
  value = module.sqs_queues.sqs_queue_arns
}