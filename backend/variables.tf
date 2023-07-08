variable "region" {
   default = "ap-northeast-2"
}

variable "bucket_postfix" {
    type = string
    description = "postfix for S3 bucket"
}

variable "bucket_sse_algorithm" {
    type = string
    description = "encryption algorithm for S3 Bucket"
    default = "AES256"
}