output "dnsaddress" {
  value = "${aws_elb.nginxweb.dns_name}"
}
