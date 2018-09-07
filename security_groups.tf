resource "aws_security_group" "allow-ssh-and-egress" {
  name = "For_VPC_Mini"

  description = "Allows SSH traffic into instances as well as all eggress."
  vpc_id      = "${aws_vpc.VPC_Mini.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 1024
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "allow_ssh-all"
  }
}