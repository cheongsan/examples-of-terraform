#!/bin/bash

HOSTNAME="${hostname}"
sudo hostnamectl set-hostname $HOSTNAME

# 변경사항 확인
echo "Current hostname:"
hostname