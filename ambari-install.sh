yum install -y httpd mysql-server mysql-connector-java
service mysqld start
service httpd start
ssh-keygen -t rsa -P '' -f /root/.ssh/id_rsa
cp /root/.ssh/id_rsa.pub /vagrant/authorized_keys
#Install oracle jdk
cp -f /vagrant/repos/*.repo /etc/yum.repos.d
yum install -y ambari-server
mysql -e "CREATE DATABASE ambari"
mysql -e "CREATE DATABASE hive"
mysql -e "CREATE DATABASE oozie"
mysql -e "CREATE DATABASE hue"


mysql -e "CREATE USER 'ambari'@'%' IDENTIFIED BY 'bigdata';"
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
