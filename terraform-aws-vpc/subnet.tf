# public subnet
resource "aws_subnet" "public_sbns" {
    count = length(var.public_subnet_cidrs)
    vpc_id = aws_vpc.vpc.id
    cidr_block = element(var.public_subnet_cidrs, count.index)
    availability_zone = element(local.az_names, count.index)

    # auto-assign public ip
    map_public_ip_on_launch = true

    # output example : <prefix>-public-subnet-a-1
    tags = {
        Name = "${var.prefix}-public-subnet-${var.availability_zones[count.index % length(local.az_names)]}${floor(count.index / local.az_count + 1)}"
    }
}

# private subnet
resource "aws_subnet" "private_sbns" {
    count = length(var.private_subnet_cidrs)
    vpc_id = aws_vpc.vpc.id
    cidr_block = element(var.private_subnet_cidrs, count.index)
    availability_zone = element(local.az_names, count.index)

    # output example : <prefix>-private-subnet-a-1
    tags = {
        Name = "${var.prefix}-private-subnet-${var.availability_zones[count.index % length(local.az_names)]}${floor(count.index / local.az_count + 1)}"
    }
}