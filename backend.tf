terraform {
  # Note: Backend variables cannot be interpolated
  backend "s3" {
    bucket         = var.bucket
    region         = var.region
    # key            = var.key
    # dynamodb_table = var.dynamodb_table
    encrypt        = true
  }
}