variables {
  bucket_name = "MyRepo"
}

run "test_resource_creation" {
  command = plan

  assert {
    condition = startswith(aws_s3_bucket.bucket.bucket, "repo-")
    error_message = "S3 Bucket name ${var.bucket_name} did not start with the expected value of ‘repo-****’."
  }
}
