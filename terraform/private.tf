resource "aws_instance" "db" {
  count         = 2
  ami           = "${lookup(var.ami_ubuntu_ebs, var.region)}"
  instance_type = "t2.small"
  key_name      = "${aws_key_pair.ssh.id}"

  subnet_id              = "${aws_subnet.private_subnet.id}"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]

  tags {
    Name = "${var.env}-db${count.index}"
    role = "db"
    side = "back"
  }

  depends_on = ["aws_security_group.default"]
}

resource "aws_security_group" "default" {
  vpc_id      = "${aws_vpc.default.id}"
  name        = "${var.env}-secgroup-default"
  description = "Security group for bastion connection and updates"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.public_subnet_cidr}"]
  }

  egress {
    from_port   = 0
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
