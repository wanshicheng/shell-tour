#!/bin/bash

if [ -f  "/etc/apt/sources.list.bak"];
then echo '备份存在'
else echo '备份不存在，创建备份'
fi
