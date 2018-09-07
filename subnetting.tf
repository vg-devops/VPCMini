resource "aws_subnet" "Public_Subnet1" {
    vpc_id = "${aws_vpc.VPC_Mini.id}"

    cidr_block = "${var.public_subnet1_cidr}"
    availability_zone = "${var.Availability_Zone_A}"
    map_public_ip_on_launch = true
    tags {
        Name = "Public Subnet 1"
    }
}