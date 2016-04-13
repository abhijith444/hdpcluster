yum install ntp ntpdate ntp-doc vim git man vim -y
service ntpd start
chkconfig iptables off /etc/init.d/iptables stop
mkdir -p .ssh

#Add Chicago Timezone
rm /etc/localtime
ln -s /usr/share/zoneinfo/America/Chicago /etc/localtime
