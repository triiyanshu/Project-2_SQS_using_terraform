# variables.tf

variable "region" {
  type    = string
  default = "eu-west-2"
}

# variable "access_key" {}

# variable "secret_key" {}

variable "access_key" {
  description = "AWS access key"
}

variable "secret_key" {
  description = "AWS secret key"
}
