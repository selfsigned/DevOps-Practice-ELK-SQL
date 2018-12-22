output "bastion_ip" {
  value = ["${aws_instance.bastion.public_ip}"]
}

output "instance_public_dns" {
  description = "Public DNS name assigned to the EC2 instance"
  value       = "${aws_instance.bastion.public_dns}"
}
