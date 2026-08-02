resource "aws_s3_bucket" "storage" {

  bucket = var.bucket_name

}

resource "aws_s3_bucket_versioning" "versioning" {

  bucket = aws_s3_bucket.storage.id

  versioning_configuration {

    status = "Enabled"

  }

}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {

  bucket = aws_s3_bucket.storage.id

  rule {

    apply_server_side_encryption_by_default {

      sse_algorithm = "AES256"

    }

  }

}

resource "aws_security_group" "web" {

  name = "WebSecurity"

  ingress {

    from_port = 22

    to_port = 22

    protocol = "tcp"

    cidr_blocks = ["192.168.1.0/24"]

  }

}