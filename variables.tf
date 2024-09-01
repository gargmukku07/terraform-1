variable "region" {
  type = string
  default = "ap-south-1"
  description = "This is my default region"
}

variable "bucket_name" {
  type = string
  description = "this is my bucket name"
  validation {
    condition = length(var.bucket_name) <= 10
    error_message = "The repository name must be less than or equal to 100 characters."
  }
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
