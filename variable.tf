###########################################
################ Default ##################
###########################################

variable "account_profile" {}
variable "region" {}

###########################################
################### VPC ###################
###########################################

variable "prefix" {}
variable "vpc_cidr" {}
variable "availability_zones" {}
variable "public_subnet_cidrs" {}
variable "private_subnet_cidrs" {}