terraform {
  backend "s3" {
    bucket = var.state_s3
    key = "terraform.tfstate"
    region = var.region
    dynamodb_table = "value"
  }
}