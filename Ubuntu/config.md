# SourceList
get the sourcelist file && update 

> wget https://mirrors.ustc.edu.cn/repogen/conf/ubuntu-https-4-bionic -O sources.list
sudo mv /etc/sources.list /etc/sources.list.bak
sudo mv sources.list /etc/sources.list
sudo apt update

# Mysql 
## Default password

> sudo vi /etc/mysql/debian.cnf

[client]
host     = localhost
user     = debian-sys-maint
password = 8t3WztBUBqSlWzRG
socket   = /var/run/mysqld/mysqld.sock

# dvwa
## create the dvwa database
CREATE DATABASE dvwa CHARACTER SET utf8;
CREATE USER 'dvwa' IDENTIFIED BY 'Dvwa,123';
GRANT ALL privileges ON dvwa.* TO 'dvwa'@'%';

## fixing the ERROR: reCAPTCHA key: Missing
Modify the dvwa/config/config.inc.php
Change:
> $_DVWA[ 'recaptcha_public_key' ] = ''; 
> $_DVWA[ 'recaptcha_private_key' ] = '';
into 
> $_DVWA[ 'recaptcha_public_key' ]  = '6LdK7xITAAzzAAJQTfL7fu6I-0aPl8KHHieAT_yJg';
> $_DVWA[ 'recaptcha_private_key' ] = '6LdK7xITAzzAAL_uw9YXVUOPoIHPZLfw2K1n5NVQ';

