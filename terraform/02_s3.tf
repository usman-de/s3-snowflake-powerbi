resource "aws_s3_bucket" "snowflake" {
  bucket = local.test_s3_bucket

  tags = {
    Name        = "snowflake"
    Environment = "test"
  }
}