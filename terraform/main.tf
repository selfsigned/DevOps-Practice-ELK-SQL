provider "aws" {
  region = "${var.region}"
}

resource "aws_key_pair" "ssh" {
  key_name   = "local_admin_key"
  public_key = "${file(var.ssh_pubkey_path)}"
}
