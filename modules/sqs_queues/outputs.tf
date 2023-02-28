output "queue_urls" {
  description = "The URLs of the created SQS queues."
  value       = [for name in var.queue_names : aws_sqs_queue.name_prefix[name].url]
}

output "dlq_urls" {
  description = "The URLs of the created DLQs."
  value       = [for name in var.dlq_names : aws_sqs_queue.dlq_prefix[name].url]
}
