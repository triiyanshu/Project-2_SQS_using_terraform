# outputs.tf

output "sqs_queue_urls" {
  value = { for name, queue in aws_sqs_queue.sqs_queues : name => queue.url }
}

output "dlq_queue_urls" {
  value = { for name, queue in aws_sqs_queue.dlq_queues : name => queue.url }
}
