# Static website Setup using Terraform and Ansible

I.) For creating AWS resources to host nginx webserver cluster which serves static website later.

List of AWS resources automatically created as part of this cloud formation script execution...

1.) VPC

2.) Subnets

3.) Security group

4.) EC2 instances

5.) ELB for High availability

6.) Route53 for domain name(www.nginxiacdemo.com)


## Getting Started

Steps to install terraform on Ubuntu / Ubuntu cloud server :

a.) Install unzip

b.) sudo apt-get install unzip
Confirm the latest version number on the terraform website:

https://www.terraform.io/downloads.html
Download latest version of the terraform (substituting newer version number if needed)

c.) wget https://releases.hashicorp.com/terraform/0.12.7/terraform_0.12.7_linux_amd64.zip
Extract the downloaded file archive

d.) unzip terraform_0.12.7_linux_amd64.zip
Move the executable into a directory searched for executables

e.) sudo mv terraform /usr/local/bin/

f.) Run "terraform --version" 

2.) Next, run terraform with the AWS access key and secury key with respective role access for automated NGINX HA setup provisioing.

Terraform commands:

#For initialization

Run "terraform init"

#For resource plan creation

Run "terraform plan"

#For acutual resource creation and infra-provisioning on AWS

Run "terraform apply"

3.) To access the static webpage, after successful running of terraform...

open the browser and access the link: www.nginxiacdemo.com

4.) Finally, to destroy the AWS resources created as part of the script execution...

#For removing the created infrastructure

Run "terraform destroy"

II.) For installing and configuring NGINX server...

1.) Install Ansible

Refer this link to install ansible on ubuntu host machine...

https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-ubuntu-18-04


2.) Run Ansible playbook with respective host addresses updated on inventory file

[all]

<WEB1> <IP_ADDRESS>
  
<WEB2> <IP_ADDRESS>
  

Then run ansible to provision webserver servers.

Ansible command: ansible-playbook playbook.yml

At last to access the static webpages running on NGINX server, click on the link below...


http://nginxiacdemo.com/index.html

