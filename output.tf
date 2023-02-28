output "queue_urls" {
  description = "The URLs of the created SQS queues."
  value       = module.sqs_queues.queue_urls
}

output "dlq_urls" {
  description = "The URLs of the created DLQs."
  value       = module.sqs_queues.dlq_urls
}