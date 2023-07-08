# use terraform backend(S3)
resource "aws_s3_bucket" "backend_bucket" {
    bucket     = "terraform-backend-${var.bucket_postfix}"
}

resource "aws_s3_bucket_acl" "backend_bucket_acl" {
    bucket     = aws_s3_bucket.backend_bucket.id
    acl        = "private"
    # depends on object ownership to activate acl 
    depends_on = [ aws_s3_bucket_ownership_controls.backend_bucket_acl_ownership ]
}

resource "aws_s3_bucket_ownership_controls" "backend_bucket_acl_ownership" {
    bucket = aws_s3_bucket.backend_bucket.id
    rule {
        object_ownership = "ObjectWriter"
    }
}

resource "aws_s3_bucket_versioning" "backend_bucket_versioning" {
    bucket = aws_s3_bucket.backend_bucket.id

    versioning_configuration {
      status = "Enabled"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "backend_bucket_encryption" {
    bucket = aws_s3_bucket.backend_bucket.id

    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = var.bucket_sse_algorithm
        }
    }
}

resource "aws_s3_bucket_public_access_block" "backend_bucket_access_block" {
    bucket = aws_s3_bucket.backend_bucket.id
    
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
}

resource "aws_dynamodb_table" "lock_backend" {
    name           = "terraform-lock"
    read_capacity  = 1
    write_capacity = 1
    hash_key       = "LockID"

    attribute {
      name = "LockID"
      type = "S"
    }
}
