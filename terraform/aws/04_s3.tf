# Type: S3 Bucket
resource "aws_s3_bucket" "snowflake" {
  bucket = local.s3_bucket
  tags = {
    Name        = local.s3_bucket
    Environment = "test"
  }
}