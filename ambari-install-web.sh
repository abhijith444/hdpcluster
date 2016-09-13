yum install -y httpd mysql-server mysql-connector-java
service mysqld start

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

wget -nv http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.4.0.1/ambari.repo -O /etc/yum.repos.d/ambari.repo

yum install -y ambari-server
yum install -y ambari-agent
# ambari-server setup -j /usr/java/jdk1.8.0_77
