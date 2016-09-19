#!/bin/bash
# 安装Phalcon框架及devtools, 用Root权限.
# @farwish  BSD-License

# First step：add extension=phalcon.so in php.ini !
# Then run this script.
# Restart php-fpm.

echo "
 ----------------------------------------------
| 欢迎使用使用安装脚本.                        |
| 以下填写 Phalcon 和 phalcon-devtools 的版本. |
 ----------------------------------------------
"

current_path=`pwd`
cphalcon_url=git://github.com/phalcon/cphalcon.git
phalcon_devtools_url=git://github.com/phalcon/phalcon-devtools.git

read -p "请输入要安装的 Phalcon tag版本( 当前推荐 phalcon-v2.0.13 ):" -t 30 cphalcon_tag

read -p "请输入要安装的 phalcon-devtools tag版本( 当前推荐 v2.0.13 ):" -t 30 phalcon_devtools_tag

if [ ! -d ${current_path}/cphalcon ]; then

    echo "下载cphalcon..."

    git clone -b ${cphalcon_tag} ${cphalcon_url}

fi

echo "安装phalcon..."

cd ${current_path}/cphalcon/build

./install

cd ${current_path}

if [ ! -d ${current_path}/phalcon-devtools ]; then

    echo "下载phalcon-devtools..."

    git clone -b ${phalcon_devtools_tag} ${phalcon_devtools_url}

fi

echo "安装phalcon-devtools..."

sh ${current_path}/phalcon-devtools/phalcon.sh

echo "phalcon.php 命令加入/usr/bin/phalcon"

ln -s ${current_path}/phalcon-devtools/phalcon.php /usr/bin/phalcon

echo "Complete! "
