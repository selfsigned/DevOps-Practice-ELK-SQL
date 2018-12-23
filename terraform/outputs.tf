output "bastion_ip" {
  value = ["${aws_instance.bastion.public_ip}"]
}

output "db_ip" {
  value = ["${aws_instance.db.*.private_ip}"]
}
