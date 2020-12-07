#!/bin/sh
sudo yum install -y httpd
sudo service httpd start
chkconfig httpd on
sudo yum install -y git
sudo yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
sudo yum install -y yum-utils
sudo yum install -y php
sudo yum-config-manager --enable remi-php56
sudo yum install -y mariadb
sudo service httpd restart
sudo yum nfs-common -y
sudo mkdir /mnt/EFS
sudo  yum install sed -y
sudo sed -i 's/DirectoryIndex index.html/DirectoryIndex index.php/' /etc/httpd/conf/httpd.conf -y

## Number 1
sudo git clone https://github.com/mauricioamendola/simple-ecomme.git/ /var/www/html/