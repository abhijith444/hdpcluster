yum install ntp ntpdate ntp-doc vim git man vim -y
service ntpd start
chkconfig iptables off /etc/init.d/iptables stop
