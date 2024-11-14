resource "aws_iam_policy" "s3-snowflake" {
  name        = local.iam_policy
  path        = "/"
  description = "Write and read access to S3 bucket for Snowflake"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
        {
        Effect   = "Allow"
        Action = [
            "s3:GetObject",
            "s3:GetObjectVersion"
        ]
        Resource = "arn:aws:s3:::<bucket>/<prefix>/*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:GetBucketLocation"
            ],
            "Resource": "arn:aws:s3:::<bucket>",
        }
    ]
  })
}