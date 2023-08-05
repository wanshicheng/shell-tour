#!/bin/bash

echo "开始配置环境..."

cp /etc/security/limits.conf /etc/security/limits.conf.bak

cat >> /etc/security/limits.conf <<EOF
* soft nofile 65536
* hard nofile 65536
EOF

sudo dphys-swapfile swapoff
sudo service dphys-swapfile stop
sudo systemctl disable dphys-swapfile

sudo chown pi /opt

echo "开始安装并配置JDK..."
tar xf ./jdk-8u381-linux-aarch64.tar.gz
mv ./jdk1.8.0_381 ./jdk


sudo sysctl -w vm.max_map_count=2000000
sudo cp /etc/sysctl.conf /etc/sysctl.conf.bak
sudo bash -c 'echo >> /etc/sysctl.conf <<EOF
vm.max_map_count=2000000
EOF
'


sudo bash -c 'cat > /etc/profile.d/jdk.sh <<EOF
export JAVA_HOME=/opt/jdk
export JRE_HOME=/opt/jdk/jre
export PATH=\$JAVA_HOME/bin:\$CATALINA_HOME/bin:\$JRE_HOME:\$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
EOF'

source /etc/profile.d/jdk.sh

echo "开始安装Doris..."
tar xf ./apache-doris-1.2.6-bin-arm64.tar.xz
mv ./apache-doris-1.2.6-bin-arm64 ./doris

