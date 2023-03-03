terraform {
  backend "s3" {
    bucket         = "example-terraform-state-bucket"
    key            = "sqs.tfstate"
    region         = "us-west-2"
    dynamodb_table = "example-terraform-state-lock"
    encrypt        = true
  }
}