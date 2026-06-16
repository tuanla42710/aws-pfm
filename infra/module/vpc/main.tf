resource "aws_vpc" "vpc" {

  cidr_block = var.vpc_cidr
  region     = "ap-southeast-2"
  tags = {
    Name = var.vpc_name
  }

}

resource "aws_subnet" "public_subnet" {

  count             = length(var.public_cidr_blocks)
  vpc_id            = aws_vpc.vpc.id
  cidr_blocks       = var.public_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name        = "public-subnet-${count.index + 1}"
    Environment = var.environment
  }
}

resource "aws_subnet" "private_subnet" {

  count             = length(var.private_cidr_blocks)
  vpc_id            = aws_vpc.vpc.id
  cidr_blocks       = var.private_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name        = "private-subnet-${count.index + 1}"
    Environment = var.environment
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "main-gateway"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public"
  }
}

resource "aws_route_table_association" "public_assoc" {
  count          = length(aws_subnet.public_subnet)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.route_table.id
}