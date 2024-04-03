resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = var.bucket_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = [
          "cloudfront.amazonaws.com"
        ]
      }
      Action = "s3:GetObject"

      Resource = [
        var.bucket_arn,
        "${var.bucket_arn}/*"
      ]
    }]
  })
}