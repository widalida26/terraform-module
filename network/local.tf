data "aws_region" "current" {}

locals {
    az_count = length(var.availability_zones)
    az_names = formatlist("${data.aws_region.current.name}%s", var.availability_zones)
}