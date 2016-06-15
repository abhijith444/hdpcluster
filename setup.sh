yum install vim ntp ntpdate ntp-doc man -y
service ntpd start
chkconfig iptables off /etc/init.d/iptables stop
mkdir -p ~/.ssh
yum localinstall -y /vagrant/hdprepofiles/jdk-8u77-linux-x64.rpm

#Add Chicago Timezone
rm /etc/localtime
ln -s /usr/share/zoneinfo/America/Chicago /etc/localtime

#Create users
useradd praneeth
useradd swathi

#Auto root
# echo -e "sudo su -\n" >> /home/vagrant/.bash_profile
