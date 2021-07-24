I used `ssh-keygen` command to generate three different Key Pairs, each will be used to SSH specific type of Server Like Bastion or Controller or Worker!

Then we are using `local-file` provider to read those public keys and then uploading to AWS to create AWS Key Pairs.
