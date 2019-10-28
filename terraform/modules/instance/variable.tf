# Variables

variable "access_key" {}
variable "secret_key" {}
variable "region" {
  description = "AWS region to launch servers."
  default = "us-east-1"
}
variable "vpc_id" {
  description = "VPC id"
  default = ""
}
variable "subnet_public_id" {
  description = "VPC public subnet id"
  default = ""
}
variable "security_group_ids" {
  description = "EC2 ssh security group"
  type = "list"
  default = []
}
variable "key_pair_name" {
  description = "EC2 Key pair name"
  default = ""
}
# Ubuntu Server 18.04 LTS (x64)
variable "instance_ami" {
  description = "EC2 instance ami"
  default = {
    us-east-1 = "ami-04b9e92b5572fa0d1"
    us-east-2 = "ami-0d5d9d301c853a04a"
    us-west-1 = "ami-0dd655843c87b6930"
    us-west-2 = "ami-06d51e91cea0dac8d"
  }
}
variable "instance_type" {
  description = "EC2 instance type"
  default = "t2.micro"
}
variable "environment_tag" {
  description = "Environment tag"
  default = ""
}
