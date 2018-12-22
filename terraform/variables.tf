variable "env" {
  default = "lab"
}

### REGION/AMI ###
variable "region" {
  default = "eu-west-3"
}

variable "ami_ubuntu_ebs" {
  type = "map"

  default = {
    eu-west-3 = "ami-0697abcfa8916e673" #18.04 LTS
  }
}

variable "ami_ubuntu_instance" {
  type = "map"

  default = {
    eu-west-3 = "ami-04789785492a9c823" #18.04 LTS
  }
}

### NETWORK ###

variable "vpc_subnet_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.42.0/24"
}

### SSH ###
variable "ssh_pubkey_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "ssh_privkey_path" {
  default = "~/.ssh/id_rsa"
}
