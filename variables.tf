variable "region" {
  type = string
  default = "ap-south-1"
  description = "This is my default region"
}

variable "bucket_name" {
  type = string
  description = "this is my bucket name"
}

variable "env" {
  type = string
  default = "dev"
  description = "this is default environment"
}

variable "state_s3" {
  type = string
  default = "my-state-bucket"
}