resource "aws_instance" "first_instance" {
    ami = "${var.ami["instance_ami"]}"
    instance_type = "${var.ami["instance_type"]}"
    count = "1"
    subnet_id   = "${aws_subnet.Public_Subnet1.id}"
    key_name = "my_key"
    associate_public_ip_address = true
    vpc_security_group_ids = ["${aws_security_group.allow-ssh-and-egress.id}",]
    //public_dns = cannot be set

  provisioner "remote-exec" {
    inline = [
      "sudo apt update && sudo apt install nginx -y",
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("~/.ssh/my_key.pem")}"
    }

  }


}

output "addresses" {
  value = ["${aws_instance.first_instance.public_dns}", "${aws_instance.first_instance.associate_public_ip_address}" ]
}