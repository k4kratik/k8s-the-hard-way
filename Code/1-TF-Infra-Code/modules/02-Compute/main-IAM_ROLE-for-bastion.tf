resource "aws_iam_role_policy" "policy_for_bastion_to_decsribe_ec2" {
  name = "policy_for_bastion_to_decsribe_ec2"
  role = aws_iam_role.role_for_bastion.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role" "role_for_bastion" {
  name = "k8s_bastion_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_instance_profile" "bastion_ec2_IAM_profile" {
  name = "bastion_ec2_IAM_profile"
  role = aws_iam_role.role_for_bastion.name
}
