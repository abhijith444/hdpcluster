ln -s /usr/share/zoneinfo/America/Chicago /etc/localtime
yum install vim ntp ntpdate ntp-doc man -y
service ntpd start
chkconfig iptables off /etc/init.d/iptables stop

wget -nv http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.4.0.1/ambari.repo -O /etc/yum.repos.d/ambari.repo
yum install -y ambari-agent 
sed -i 's/localhost/ambari.mycluster.com/' /etc/ambari-agent/conf/ambari-agent.ini;
ambari-agent restart
# ambari-server setup -j /usr/java/jdk1.8.0_77
