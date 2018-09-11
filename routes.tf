resource "aws_route_table" "public-rt" {
  vpc_id = "${aws_vpc.VPC_Mini.id}"
 
  route {
    cidr_block = "${var.any_IP_cidr}"
    gateway_id = "${aws_internet_gateway.Main_GW1.id}"
  }
 
  tags {
    Name = "RT for Public Subnet"
  }
}

resource "aws_route_table_association" "public-rt" {
  subnet_id = "${aws_subnet.Public_Subnet1.id}"
  route_table_id = "${aws_route_table.public-rt.id}"
}