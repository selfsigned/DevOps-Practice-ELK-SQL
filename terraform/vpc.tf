# VPC
resource "aws_vpc" "default" {
  cidr_block           = "${var.vpc_subnet_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "${var.env}-vpc"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name = "${var.env}-internet_gateway"
  }
}

# Public subnet

resource "aws_subnet" "public_subnet" {
  vpc_id     = "${aws_vpc.default.id}"
  cidr_block = "${var.public_subnet_cidr}"

  map_public_ip_on_launch = true

  tags {
    Name = "${var.env}-public_subnet"
  }
}

resource "aws_route_table" "public_routetable" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.internet_gateway.id}"
  }

  tags {
    Name = "${var.env}-public_routetable"
  }
}

resource "aws_route_table_association" "public_subnet" {
  subnet_id      = "${aws_subnet.public_subnet.id}"
  route_table_id = "${aws_route_table.public_routetable.id}"
}

# NAT
resource "aws_eip" "nat_eip" {
  count = 1
  vpc   = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.nat_eip.id}"
  subnet_id     = "${aws_subnet.public_subnet.id}"
}
