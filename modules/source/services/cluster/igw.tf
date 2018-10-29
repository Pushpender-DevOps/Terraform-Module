resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = "${aws_vpc.common.id}"
}

resource "aws_route_table" "public_routetable" {
  vpc_id = "${aws_vpc.common.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.internet_gateway.id}"
  }

  tags {
    label = "blog"
  }
}

resource "aws_route_table_association" "public_subnet_a" {
  subnet_id      = "${aws_subnet.public_subnet_a.id}"
  route_table_id = "${aws_route_table.public_routetable.id}"
}
