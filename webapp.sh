#!/bin/bash
sudo apt -y update
sudo apt -y install nginx
sudo rm -rf /var/www/html/*
sudo git clone https://github.com/Saideva12/ecomm.git /var/www/html
