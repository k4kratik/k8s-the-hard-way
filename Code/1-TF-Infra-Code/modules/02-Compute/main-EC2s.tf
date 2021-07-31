resource "aws_instance" "k8s-bastion-instance" {
  count = 1

  associate_public_ip_address = true

  # ami               = data.aws_ami.latest-ubuntu.image_id
  ami               = "ami-0cacd59d567c14579"
  availability_zone = var.az[count.index]
  instance_type     = var.instance_type
  subnet_id         = var.public_subnets[count.index].id

  vpc_security_group_ids = ["${aws_security_group.k8s_bastion_SG.id}"]

  key_name = aws_key_pair.k8s_bastion_keypair.key_name

  iam_instance_profile = aws_iam_instance_profile.bastion_ec2_IAM_profile.name

  root_block_device {
    volume_size = var.bastion_ebs_size
    tags = {
      Name = "k8s_bastion_root_vol-${count.index}"
    }
  }
  tags = {
    Name = "k8s_bastion_instance-${count.index}"
    Role = "k8s_bastion"
  }
}



resource "aws_instance" "k8s-controller-instance" {
  count = var.k8s-controllers-count

  associate_public_ip_address = false

  # ami               = data.aws_ami.latest-ubuntu.image_id
  ami               = "ami-0cacd59d567c14579"
  availability_zone = var.az[count.index]
  instance_type     = var.instance_type
  subnet_id         = var.private_subnets[count.index].id


  vpc_security_group_ids = ["${aws_security_group.k8s_controller_SG.id}"]

  key_name = aws_key_pair.k8s_controllers_keypair.key_name

  root_block_device {
    volume_size = var.controller_ebs_size
    tags = {
      Name = "k8s_controller_root_vol-${count.index}"
    }
  }
  tags = {
    Name = "k8s_controller_instance-${count.index}"
    Role = "k8s_master"
  }
}


resource "aws_instance" "k8s-worker-instance" {
  count = var.k8s-workers-count

  associate_public_ip_address = false

  # ami               = data.aws_ami.latest-ubuntu.image_id
  ami               = "ami-0cacd59d567c14579"
  availability_zone = var.az[count.index]
  instance_type     = var.instance_type
  subnet_id         = var.private_subnets[count.index].id


  vpc_security_group_ids = ["${aws_security_group.k8s_worker_SG.id}"]

  key_name = aws_key_pair.k8s_workers_keypair.key_name

  root_block_device {
    volume_size = var.worker_ebs_size
    tags = {
      Name = "k8s_worker_root_vol-${count.index}"
    }
  }
  tags = {
    Name = "k8s_worker_instance-${count.index}"
    Role = "k8s_worker"
  }
}

