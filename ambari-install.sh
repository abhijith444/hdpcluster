yum install -y httpd mysql-server mysql-connector-java
service mysqld start
service httpd start

mysql -e "CREATE DATABASE ambari"
mysql -e "CREATE DATABASE hive"
mysql -e "CREATE DATABASE oozie"
mysql -e "CREATE DATABASE hue"


mysql -e "CREATE USER 'ambari'@'%' IDENTIFIED BY 'bigdata';"
mysql -e "CREATE USER 'ambari'@'ambari.mycluster.com' IDENTIFIED BY 'bigdata';"
mysql -e "CREATE USER 'ambari'@'localhost' IDENTIFIED BY 'bigdata';"
mysql -e "CREATE USER 'hive'@'%' IDENTIFIED BY 'bigdata';"
mysql -e "CREATE USER 'hive'@'localhost' IDENTIFIED BY 'bigdata';"
mysql -e "CREATE USER 'oozie'@'%' IDENTIFIED BY 'bigdata';"
mysql -e "CREATE USER 'oozie'@'localhost' IDENTIFIED BY 'bigdata';"
mysql -e "CREATE USER 'hue'@'%' IDENTIFIED BY 'bigdata';"
mysql -e "CREATE USER 'hue'@'localhost' IDENTIFIED BY 'bigdata';"

mysql -e "GRANT ALL PRIVILEGES ON ambari.* TO 'ambari';"
mysql -e "GRANT ALL PRIVILEGES ON hive.* TO 'hive';"
mysql -e "GRANT ALL PRIVILEGES ON oozie.* TO 'oozie';"
mysql -e "GRANT ALL PRIVILEGES ON hue.* TO 'hue';"

mkdir -p /var/www/html/hdp
tar xvf /vagrant/hdprepofiles/ambari-2.2.0.0-centos6.tar.gz -C /var/www/html
tar xvf /vagrant/hdprepofiles/HDP-2.3.4.0-centos6-rpm.tar.gz -C /var/www/html/hdp
tar xvf /vagrant/hdprepofiles/HDP-UTILS-1.1.0.20-centos6.tar.gz -C /var/www/html/hdp

cp -f /vagrant/repos/*.repo /etc/yum.repos.d
yum install -y ambari-server
# ambari-server setup -j /usr/java/jdk1.8.0_77

