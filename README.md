Region-Creator by terraform

this project wrote by terraform version 0.13.1.

propose of the code is creating almost fully region.

the services that creating:
  * vpc with 4 subnets (2 private and 2 public).
  * security group with open ports 443, 80 from 0.0.0.0/0
  * internet gateway for the public subnet
  * nat gateway for private subnet
  * security group that allowing comunication between the instances that member the same secirity group.
  * upload ssh-key
  * route table each subnet
  * elb
  * route 53 zone (with option to disable the creation of route53 record by set the key addToRoute53 = false )

missing parts:
  * upload certificate for elb.
  * set backend to s3 for save state.

to run the project:
  1. required terraform >= 0.13
  2. required aws access and secret key with relavant permmision. (admin)
  2. under the directory us-east-1 in variable.tf change the relavent keys for example: route53_zone to register the correct domain. 
  3. run the command terraform init under the directory us-east-1
  than run terraform plan to make sure everything plans as expected and than terraform apply --auto-approve




