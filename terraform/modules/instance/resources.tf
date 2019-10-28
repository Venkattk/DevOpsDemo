provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "web" {
  count         = "${var.instance_count}"
  ami           = "${lookup(var.ami,var.aws_region)}"
  instance_type = "${var.instance_type}"
  subnet_id = "${var.subnet_public_id}"
  vpc_security_group_ids = ["${var.security_group_ids}"]
  key_name = "${var.key_pair_name}"
  #user_data     = "${file("installNginx.sh")}"

  tags {
		Name  = "${element(var.instance_tags, count.index)}"
	}
}

resource "aws_elb" "nginxweb" {
  name = "nginxweb-elb"

  subnets         = ["${var.subnet_public_id}"]
  security_groups = ["${var.security_group_ids}"]
  instances       = ["${element(aws_instance.web.*, count.index)}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}
