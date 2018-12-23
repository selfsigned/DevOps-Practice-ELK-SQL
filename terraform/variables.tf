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

# Change this to your ssh key path
variable "ssh_privkey_path" {
  default = "~/.ssh/id_rsa_alt"
}

variable "ssh_pubkey_path" {
  default = "~/.ssh/id_rsa_alt.pub"
}

### INSTANCES ###

