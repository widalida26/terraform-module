# # backend
# module "backend" {
#     source         = "./backend"
#     bucket_postfix = "wdb-tf-test"
# }

# network
module "network" {
  source               = "./network"
  vpc_prefix           = var.vpc_prefix
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}