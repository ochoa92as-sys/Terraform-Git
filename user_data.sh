#!/bin/bash
echo "Este mensaje es un mensaje" > ~/test.txt
yum update -y
yum install httpd -y
systemctl enable httpd
systemctl start httpd