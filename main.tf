# # backend
# module "backend" {
#     source         = "./backend"
#     bucket_postfix = "wdb-tf-test"
# }

# network
module "network" {
  source               = "./terraform-aws-vpc"
  prefix           = var.prefix
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}