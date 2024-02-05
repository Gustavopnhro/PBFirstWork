#!/bin/bash

sudo mount -t efs fs-05462f6621439786d.efs.us-east-1.amazonaws.com /mnt/efs
sudo systemctl enable httpd
sudo systemctl start httpd
sudo systemctl status httpd
