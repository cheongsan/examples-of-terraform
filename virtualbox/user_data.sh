#!/bin/bash
# user_data.sh

# 정적 호스트 파일 수정
echo "192.168.56.100  dns.cheongsan.com  dns" | sudo tee -a /etc/hosts
echo "192.168.56.101  awx.cheongsan.com  awx" | sudo tee -a /etc/hosts
echo "192.168.56.102  kdc.cheongsan.com  kdc" | sudo tee -a /etc/hosts

# Kerberos 인증 프로그램 설치
dnf updaete -y
dnf intsall -y krb5-workstation

# Kolla-Ansible용 Python 종속성 설치 및 가상 환경 생성
dnf install -y python3-devel libffi-devel gcc openssl-devel python3-libselinux
python3 -m venv ~/kolla
source ~/kolla/bin/activate
pip install -U pip