# Mysql Configuration
## installation
[download mysql ](https://dev.mysql.com/doc/mysql-yum-repo-quick-guide/en/)  (select the mysql to 5.7)

## root password 
> ALTER USER 'root'@'localhost' IDENTIFIED BY 'Mysql,4286';

## set password security lever
show variables like 'validate_password%';
set global validate_password_policy=0;
set global validate_password_length=1;

## create database sonar and privilege 
CREATE DATABASE sonar CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE USER 'sonar' IDENTIFIED BY 'sonar';
GRANT ALL privileges ON sonar.* TO 'sonar'@'%';
flush privileges;

## dvwa database 
CREATE DATABASE dvwa CHARACTER SET utf8;
CREATE USER 'dvwa' IDENTIFIED BY 'Dvwa,123';
GRANT ALL privileges ON dvwa.* TO 'dvwa'@'%';

# Apache Error Fixing 
## 403 Forbidden response 
Every so often I run into a 403 Forbidden response when I'm setting up something in Apache, checking the log files will yield something like:
### Make sure it's not denied by Apache
Most apache Configurations have something like this in there:

> ` <Directory /> 
    Order deny,allow
    Deny from all
 </Directory> `

The above will block access to all files. You should also see something like this:

>  ` <Directory /path/to/webroot>
    Order allow,deny
    Allow from all
 </Directory> ` 
 
So if you have created a VirtualHost or an Alias that does not fall under this /path/to/webroot apache will have denied access to it. The solution in that case is to add another Directory entry in your httpd.conf to allow access to that directory.
Make sure Apache has Read, Execute Permissions
The next thing to check is that Apache has read and execute permission (rx) on directories and read permission on files. You can run chmod 750 /dir (to give -rwxr-x--- permission) or chmod 755 /dir (to give -rwxr-xr-x permission), etc.
Make sure that the Directory Above has Execute Permission
This is the one that tends to get me. Suppose you are creating an Alias like this:
> Alias /foo /tmp/bar/foo
 
Now you have made sure that apache can read and execute /tmp/bar/foo by running chmod 755 /tmp/bar/foo, but you also need to give Apache execute permission to /tmp/bar/ otherwise it cannot traverse the sub directory foo.

### If Running Security Enhanced Linux (SELinux)
Another possibility for this error is that you are running SELinux (Security Enhanced Linux), inwhich case you need to use chcon to apply the proper security context to the directory. One easy way to do this is to copy from a directory that does work for example /var/www/
> chcon -R --reference=/var/www /path/to/webroot 

# DVWA Configuration
## fixing the ERROR: reCAPTCHA key: Missing
Modify the dvwa/config/config.inc.php
Change:
> $_DVWA[ 'recaptcha_public_key' ] = ''; 
> $_DVWA[ 'recaptcha_private_key' ] = '';
into 
> $_DVWA[ 'recaptcha_public_key' ]  = '6LdK7xITAAzzAAJQTfL7fu6I-0aPl8KHHieAT_yJg';
> $_DVWA[ 'recaptcha_private_key' ] = '6LdK7xITAzzAAL_uw9YXVUOPoIHPZLfw2K1n5NVQ';
