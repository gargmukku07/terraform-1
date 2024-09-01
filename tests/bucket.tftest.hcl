variables {
  bucket_name = "repo-abc"
}

run "test_resource_creation" {
  command = plan

  assert {
    condition = startswith(aws_s3_bucket.bucket.bucket, "repo-")
    error_message = "S3 Bucket name ${var.bucket_name} did not start with the expected value of ‘repo-****’."
  }
}


run "test_invalid_var" {
  command = plan

  variables {
  bucket_name = "this_is_a_repository_name_longer_than_100_characters_7rfD86rGwuqhF3TH9d3Y99r7vq6JZBZJkhw5h4eGEawBntZmvy"
}

  expect_failures = [
    var.bucket_name
  ]
}
