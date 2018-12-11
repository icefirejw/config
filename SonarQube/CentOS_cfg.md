# mysql configuration
## installation
https://dev.mysql.com/doc/mysql-yum-repo-quick-guide/en/
select the mysql to 5.7

## root password 
ALTER USER 'root'@'localhost' IDENTIFIED BY 'Mysql,4286';

## set password security lever
show variables like 'validate_password%';
set global validate_password_policy=0;
set global validate_password_length=1;

## create database sonar and privilege 
CREATE DATABASE sonar CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE USER 'sonar' IDENTIFIED BY 'sonar';
GRANT ALL privileges ON sonar.* TO 'sonar'@'%';
flush privileges;