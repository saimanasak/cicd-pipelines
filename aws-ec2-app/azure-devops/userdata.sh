#!/bin/bash

# Commands to update and install Apache
yum update -y
yum install -y httpd

# Commands to start and enable Apache
systemctl start httpd
systemctl enable httpd

# Copies index.html from the agent's temp directory to ec2 server
cp $(Agent.TempDirectory)/index.html /var/www/html/index.html