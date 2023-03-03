variable "region" {
  description = "The region in which to create the SQS queues and DLQs."
  default = "eu-west-1"
}

variable "bucket" {
  description = "The name of the S3 bucket to use for remote state storage."
  type        = string
  default     = "test-bucket"
}
# variable "tags" {
#   description = "Tags to apply to the SQS queues and DLQs."
#   type        = map(string)
#   default = {
#     Project     = "cd"
#     Environment = "dev"
#   }
# }

variable "key" {
  description = "terraform state"
  type = string
  default = "terraform.tfstate"
}

