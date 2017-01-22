yum install -y httpd
chkconfig httpd on
mkdir -p /var/www/html/hdp
wget http://public-repo-1.hortonworks.com/HDP/centos6/2.x/updates/2.5.3.0/HDP-2.5.3.0-centos6-rpm.tar.gz -P /tmp
wget http://public-repo-1.hortonworks.com/HDP-UTILS-1.1.0.21/repos/centos6/HDP-UTILS-1.1.0.21-centos6.tar.gz -P /tmp

tar -xf /tmp/HDP-2.5.3.0-centos6-rpm.tar.gz -C /var/www/html/hdp
tar -xf /tmp/HDP-UTILS-1.1.0.21-centos6.tar.gz -C /var/www/html/hdp
