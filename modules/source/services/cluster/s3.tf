resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"
  acl    = "private"
// for enable versioning

  versioning {
    enabled = true
  }
//for tag

  tags {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
