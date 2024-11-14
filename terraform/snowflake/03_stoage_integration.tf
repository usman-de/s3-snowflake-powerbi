resource "snowflake_storage_integration" "s3_integration" {
  name    = "s3_integration"
  comment = "A storage integration of Snowflake with S3"
  type    = "EXTERNAL_STAGE"

  enabled = true

    storage_allowed_locations = ["('s3://s3-snowflake-pipeline/loading/')"]

  storage_provider         = "S3"
  storage_aws_role_arn = local.storage_aws_role_arn
  storage_aws_external_id  = "s3-snowflake-openalex-authors-access"
}