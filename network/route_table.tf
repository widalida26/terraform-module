# route table
resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.vpc.id

    tags = {
        Name = "${var.vpc_prefix}-public-rt"
    }
}
resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.vpc.id

    tags = {
        Name = "${var.vpc_prefix}-private-rt"
    }
}

# public routing association
resource "aws_route_table_association" "public_rta" {
    count = length(toset(var.public_subnet_cidrs))

    subnet_id      =  aws_subnet.public_sbns[count.index].id
    route_table_id =  aws_route_table.public_rt.id
}

# private routing association
resource "aws_route_table_association" "private_rta" {
    count = length(toset(var.private_subnet_cidrs))

    subnet_id      =  aws_subnet.private_sbns[count.index].id
    route_table_id =  aws_route_table.private_rt.id
}