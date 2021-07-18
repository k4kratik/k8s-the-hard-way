data "aws_ami" "latest-ubuntu" {

#   executable_users = ["self"]
  most_recent      = true
  owners           = ["099720109477"] # Canonical's Account ID

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-hirsute-21.04-amd64-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
