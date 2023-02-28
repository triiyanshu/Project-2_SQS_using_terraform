locals {
  sqs_queues = {
    for env, name in var.sqs_queue_names : env => aws_sqs_queue.name_prefix[env].arn
  }

  dlqs = {
    for env, name in var.dlq_names : env => aws_sqs_queue.dlq_prefix[env].arn
  }
}

resource "aws_sqs_queue" "name_prefix" {
  for_each = var.sqs_queue_names
  sqs_queue_names = var.sqs_queue_names
  dlq_names = var.dlq_names
  
  # tags = var.tags
  name = each.value
  tags = var.tags
}

resource "aws_sqs_queue" "dlq_prefix" {
  for_each = var.dlq_names

  name = each.value
  tags = var.tags

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.name_prefix[each.key].arn
    maxReceiveCount = 5
  })
}

output "sqs_queue_arns" {
  value = local.sqs_queues
}

output "dlq_arns" {
  value = local.dlqs
}