resource "aws_s3_bucket" "bucket_cerberos" {
  bucket = local.sufix_s3
}