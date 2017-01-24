Once ambari agent is installed on the node.
You need to run the following to point it to our ambari

sudo sed -i 's/localhost/ambari.mycluster.com/' /etc/ambari-agent/conf/ambari-agent.ini; sudo ambari-agent restart

ambari.mycluster.com
comp1.mycluster.com
comp2.mycluster.com
comp3.mycluster.com
