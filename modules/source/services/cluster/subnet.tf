resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = "${aws_vpc.common.id}"
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "${var.region}"
  map_public_ip_on_launch = false

  tags {
    Name = "blog"
  }
}

resource "aws_subnet" "private_subnet_a" {
  vpc_id                  = "${aws_vpc.common.id}"
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "${var.region}"

  tags {
    Name = "blog"
  }
}