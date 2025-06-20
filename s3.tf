# create 'data01' bucket in all regions
resource "aws_s3_bucket" "data01" {
  bucket = "sjb-${var.region_prefix}-data01"
}

# data01 bucket ownership
resource "aws_s3_bucket_ownership_controls" "data01" {
  bucket = aws_s3_bucket.data01.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# data01 bucket acl
resource "aws_s3_bucket_acl" "data01" {
  depends_on = [aws_s3_bucket_ownership_controls.data01]

  bucket = aws_s3_bucket.data01.id
  acl    = "private"
}

# data01 bucket encryption key
resource "aws_s3_bucket_server_side_encryption_configuration" "data01" {
  bucket = aws_s3_bucket.data01.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.bucket_encryption_key_arn
      sse_algorithm     = "aws:kms"
    }
  }
}

# data01 bucket 'data' folder'
resource "aws_s3_object" "data01" {
  bucket = aws_s3_bucket.data01.id
  key    = "data/"
  acl    = "private"
}

## data02 conditional bucket
# data02 bucket should be eu-north01/Stockholm only
resource "aws_s3_bucket" "data02" {
  count  = var.just_eu_north_1 == true ? 1 : 0
  bucket = "sjb-${var.region_prefix}-data02"
}

# data02 bucket ownership
resource "aws_s3_bucket_ownership_controls" "data02" {
  count  = var.just_eu_north_1 == true ? 1 : 0
  bucket = aws_s3_bucket.data02[0].id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# data02 bucket acl
resource "aws_s3_bucket_acl" "data02" {
  count      = var.just_eu_north_1 == true ? 1 : 0
  depends_on = [aws_s3_bucket_ownership_controls.data02]

  bucket = aws_s3_bucket.data02[0].id
  acl    = "private"
}

# data02 bucket encryption key
resource "aws_s3_bucket_server_side_encryption_configuration" "data02" {
  count  = var.just_eu_north_1 == true ? 1 : 0
  bucket = aws_s3_bucket.data02[0].id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.bucket_encryption_key_arn
      sse_algorithm     = "aws:kms"
    }
  }
}

# data02 bucket 'data' folder'
resource "aws_s3_object" "data02" {
  count  = var.just_eu_north_1 == true ? 1 : 0
  bucket = aws_s3_bucket.data02[0].id
  key    = "data/"
  acl    = "private"
}
