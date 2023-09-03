#!/bin/bash
set -e

# 换apt源
if [ -f "/etc/apt/sources.list.bak" ]; 
then 
    echo '/etc/apt/sources.list.bak备份存在'
else 
    sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
fi

sudo bash -c 'cat > /etc/apt/sources.list <<EOF
deb https://mirrors.aliyun.com/debian/ bullseye main non-free contrib
deb-src https://mirrors.aliyun.com/debian/ bullseye main non-free contrib
deb https://mirrors.aliyun.com/debian-security/ bullseye-security main
deb-src https://mirrors.aliyun.com/debian-security/ bullseye-security main
deb https://mirrors.aliyun.com/debian/ bullseye-updates main non-free contrib
deb-src https://mirrors.aliyun.com/debian/ bullseye-updates main non-free contrib
deb https://mirrors.aliyun.com/debian/ bullseye-backports main non-free contrib
deb-src https://mirrors.aliyun.com/debian/ bullseye-backports main non-free contrib
EOF
'
sudo apt-get update 
sudo apt-get upgrade -y

