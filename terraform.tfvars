sqs_queue_names = {
  dev  = "cd-dev-issue-package-builder-queue"
  uat  = "cd-uat-issue-package-builder-queue"
  live = "cd-live-issue-package-builder-queue"
}

dlq_names = {
  dev  = "cd-dev-issue-package-builder-dlq"
  uat  = "cd-uat-issue-package-builder-dlq"
  live = "cd-live-issue-package-builder-dlq"
}

tags = {
  Project     = "cd"
  Environment = "dev"
}