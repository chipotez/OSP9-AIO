source ~/stackrc

heat stack-list
echo \n
echo "heat stack-list <UUID>"
echo \n

echo \n
ironic node-list
echo \n
echo "ejecute ironic node-delete <UUID>"
echo \n

rm /home/stack/undercloud-passwords.conf
systemctl list-units | grep openstack | awk '{print $1}' | xargs -I {} sudo systemctl stop {}
systemctl list-units | grep neutron | awk '{print $1}' | xargs -I {} sudo systemctl stop {}
sudo systemctl stop keepalived
sudo rm -rf /var/lib/mysql /var/lib/rabbitmq /etc/keystone /opt/stack/.undercloud-setup /root/stackrc  /var/lib/ironic-discoverd/discoverd.sqlite
dirs="ceilometer heat glance horizon ironic ironic-discoverd keystone neutron nova swift haproxy"; for dir in $dirs; do sudo rm -rf /etc/$dir ; sudo rm -rf /var/log/$dir ;  sudo rm -rf /var/lib/$dir; done
sudo yum remove -y rabbitmq-server mariadb haproxy keepalived $(rpm -qa | grep openstack)
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#!!!! remove all interface configuration which is related to openvswitch from /etc/sysconfig/network-scripts !!!!
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
sudo reboot
# After reboot, install:
sudo yum install -y python-tripleoclient
openstack undercloud install
#sudo yum install  python-tripleoclient
