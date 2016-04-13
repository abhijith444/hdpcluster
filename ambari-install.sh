wget -nv http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.2.0.0/ambari.repo -O /etc/yum.repos.d/ambari.repo
yum install -y ambari-server
yum install -y mysql-server mysql-connector-java
mysql -e "CREATE USER 'ambari'@'%' IDENTIFIED BY 'bigdata';"
mysql -e "GRANT ALL PRIVILEGES ON ambari.* TO 'ambari';"
mysql -e "GRANT ALL PRIVILEGES ON hive.* TO 'hive';"
mysql -e "GRANT ALL PRIVILEGES ON oozie.* TO 'oozie';"
