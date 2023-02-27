resource "aws_sqs_queue" "queue" {
    name  = "cd-dev-issue-package-builder-queue"
    tags = {
        Environment = "dev"
    }
}

resource "aws_sqs_queue" "queue" {
    name  = "cd-uat-issue-package-builder-queue"
    tags = {
        Environment = "uat"
    }
}

resource "aws_sqs_queue" "queue" {
    name  = "cd-live-issue-package-builder-queue"  

    tags = {
        Environment = "live"
    } 
}

resource "aws_sqs_queue" "terraform_queue_deadletter" {
    name = "cd-dev-issue-package-builder-dlq"
}

resource "aws_sqs_queue" "terraform_queue_deadletter" {
    name = "cd-uat-issue-package-builder-dlq"
}
resource "aws_sqs_queue" "terraform_queue_deadletter" {
    name = "cd-live-issue-package-builder-dlq"
}