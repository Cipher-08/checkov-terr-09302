
resource "aws_s3_bucket" "vulnerable_bucket" {
  bucket = "unique-s3-bucket-${random_id.bucket_id.hex}"

  acl    = "public-read" 

  versioning {
    enabled = false # Vulnerability: Versioning is not enabled
  }

  lifecycle_rule {
    enabled = true
    transition {
      days          = 30
      storage_class = "GLACIER"
    }
    expiration {
      days = 365
    }
  }

  logging {
    target_bucket = "" # Vulnerability: No logging enabled
  }

  tags = {
    Name        = "Vulnerable S3 Bucket"
    Environment = "Dev"
  }
}

resource "random_id" "bucket_id" {
  byte_length = 8
}

output "bucket_name" {
  value = aws_s3_bucket.vulnerable_bucket.bucket
}
