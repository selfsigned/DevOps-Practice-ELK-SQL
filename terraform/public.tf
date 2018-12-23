resource "aws_instance" "bastion" {
  ami           = "${lookup(var.ami_ubuntu_ebs, var.region)}"
  instance_type = "t2.nano"
  key_name      = "${aws_key_pair.ssh.id}"

  subnet_id              = "${aws_subnet.public_subnet.id}"
  vpc_security_group_ids = ["${aws_security_group.bastion.id}"]

  tags {
    Name = "${var.env}-bastion"
    side = "front"
  }

  depends_on = ["aws_security_group.bastion"]
}

resource "aws_security_group" "bastion" {
  vpc_id      = "${aws_vpc.default.id}"
  name        = "${var.env}-secgroup-bastion"
  description = "SSH and private resource acces"

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
