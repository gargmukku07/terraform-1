provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "msk-tec-test-buc-1"

  tags = {
    Name = "msk-tec-test-buc-1"
    Env  = "Dev"
  }

}