output "bastion_ip" {
  value = ["${aws_instance.bastion.public_ip}"]
}

output "db_ips" {
  value = ["${aws_instance.db.*.private_ip}"]
}
