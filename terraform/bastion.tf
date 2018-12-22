resource "aws_instance" "bastion" {
  ami             = "${lookup(var.ami_ubuntu_ebs, var.region)}"
  instance_type   = "t2.micro"
  key_name        = "${aws_key_pair.ssh.id}"
  security_groups = ["${aws_security_group.bastion.id}"]

  subnet_id = "${aws_subnet.public_subnet.id}"

  tags {
    Name = "${var.env}-bastion"
    side = "front"
  }

  connection {
    user        = "ubuntu"
    private_key = "${file(var.ssh_privkey_path)}"
  }

  depends_on = ["aws_security_group.bastion"]
}

resource "aws_security_group" "bastion" {
  name        = "${var.env}-secgroup-bastion"
  description = "SSH and private resource acces"
  vpc_id      = "${aws_vpc.default.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
  }
}
