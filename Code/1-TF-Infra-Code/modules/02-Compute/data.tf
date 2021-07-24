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

# I was using this to fetch the latest ubuntu  21 AMI but then I faced an issue where If my latest AMI is changed, my EC2 will have to be replaced with new EC2s with new AMIs and I dont want to replace them.