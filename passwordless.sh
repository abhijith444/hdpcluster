vagrant ssh ambari "sudo ssh-keygen -t rsa -P '' -f /root/.ssh/id_rsa"
vagrant ssh ambari "sudo cp /root/.ssh/id_rsa.pub /shared"
vagrant ssh ambari "sudo cat /shared/id_rsa.pub >>~/.ssh/authorized_keys"
vagrant ssh edge "sudo cat /shared/id_rsa.pub >>~/.ssh/authorized_keys"
vagrant ssh comp1 "sudo cat /shared/id_rsa.pub >>~/.ssh/authorized_keys"
vagrant ssh comp2 "sudo cat /shared/id_rsa.pub >>~/.ssh/authorized_keys"
vagrant ssh comp3 "sudo cat /shared/id_rsa.pub >>~/.ssh/authorized_keys"


