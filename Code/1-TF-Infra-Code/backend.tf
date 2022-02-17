terraform {
  backend "s3" {
    bucket = "terraform-storage-bucket-397795833797"
    # I had to hard code the account number as TF does not support interpolation in the backend file.
    key    = "state-files/C137-local-terraform-state-for-k8s-hard-way.tfstate"
    region = "us-east-1"
  }
}
