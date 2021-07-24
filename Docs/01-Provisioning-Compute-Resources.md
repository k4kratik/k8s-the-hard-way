We are using Terraform to provision our resources.
We are using AWS Cloud.

For that we have to setup the backend first.

I wanted to use a variable in backend file but turns out Terraform does not support that yet.

Remote backend.

S3 and dynamodb tables

Output the account id


we will use modules to separate networking and compute resources.
Created two modules, will add in main main.tf file.