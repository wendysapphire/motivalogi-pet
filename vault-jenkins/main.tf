# VPC
resource "aws_vpc" "main" {
	cidr_block = "10.0.0.0/16"
	enable_dns_support = true
	enable_dns_hostnames = true
	tags = {
		Name = "main-vpc"
	}
}

# Subnet 1
resource "aws_subnet" "subnet1" {
	vpc_id            = aws_vpc.main.id
	cidr_block        = "10.0.1.0/24"
	availability_zone = "eu-west-1a"
	tags = {
		Name = "subnet-1"
	}
}

# Subnet 2
resource "aws_subnet" "subnet2" {
	vpc_id            = aws_vpc.main.id
	cidr_block        = "10.0.2.0/24"
	availability_zone = "eu-west-1b"
	tags = {
		Name = "subnet-2"
	}
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
	vpc_id = aws_vpc.main.id
	tags = {
		Name = "main-igw"
	}
}

# Route Table
resource "aws_route_table" "rt" {
	vpc_id = aws_vpc.main.id
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.igw.id
	}
	tags = {
		Name = "main-rt"
	}
}

# Route Table Associations
resource "aws_route_table_association" "a1" {
	subnet_id      = aws_subnet.subnet1.id
	route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "a2" {
	subnet_id      = aws_subnet.subnet2.id
	route_table_id = aws_route_table.rt.id
}

# Security Group
resource "aws_security_group" "main_sg" {
	name        = "main-sg"
	description = "Allow all inbound traffic"
	vpc_id      = aws_vpc.main.id

	ingress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	tags = {
		Name = "main-sg"
	}
}
