variable "allowed_account_id" {
  description = "The id of the one AWS account this code is permitted to run against"
  type        = string
}

provider "aws" {
  region              = "us-east-1"
  allowed_account_ids = [var.allowed_account_id]
}

