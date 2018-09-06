provider "aws" {
  region = "${var.region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

resource "aws_vpc" "VPC_Mini" {
  cidr_block = "${var.vpc_cidr}"
  tags {
    Name = "VPC_Mini"
  }
}

resource "aws_internet_gateway" "Main_GW1" {
  vpc_id = "${aws_vpc.Main_VPC.id}"

  tags {
    Name = "Main_GW1"
  }
}