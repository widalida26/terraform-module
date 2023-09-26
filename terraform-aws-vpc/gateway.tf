# internet gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id

    tags = {
        Name = "${var.prefix}-igw"
    }
}

resource "aws_route" "public_route" {
    route_table_id         = aws_route_table.public_rt.id
    destination_cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.igw.id

    timeouts {
       create = "5m"
    }
}

# nat gateway
# resource "aws_nat_gateway" "nat_1" {
#     subnet_id = aws_subnet.public_sbns[0].id
#     allocation_id = aws_eip.eip_nat_1.id

#     tags = {
#         Name = "${var.vpc_prefix}-nat-${var.availability_zones[0]}"
#     }
# }

# # eip for nat
# resource "aws_eip" "eip_nat_1" {
#    vpc = true
#    depends_on = [aws_route_table.public_rt]

#    tags = {
#         Name = "${var.vpc_prefix}-eip-nat-${var.availability_zones[0]}"
#    }
# }

# # routing
# resource "aws_route" "public_rt" {
#     route_table_id = aws_route_table.public_rt.id
# }