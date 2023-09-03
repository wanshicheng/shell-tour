#!/bin/bash

sudo bash -c 'cat >> /etc/hosts <<EOF
192.168.3.11 node01
192.168.3.12 node02
192.168.3.13 node03
192.168.3.14 node04
EOF
'