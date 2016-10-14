192.168.122.206_amqp.pp:                          [ ERROR ]           
Applying Puppet manifests                         [ ERROR ]

ERROR : Error appeared during Puppet run: 192.168.122.206_amqp.pp
Error: Could not start Service[rabbitmq-server]: Execution of '/usr/bin/systemctl start rabbitmq-server' returned 1: Job for rabbitmq-server.service failed because the control process exited with error code. See "systemctl status rabbitmq-server.service" and "journalctl -xe" for details.
You will find full trace in log /var/tmp/packstack/20161012-211731-SCOxL_/manifests/192.168.122.206_amqp.pp.log
Please check log file /var/tmp/packstack/20161012-211731-SCOxL_/openstack-setup.log for more information


Solución:

[root@localhost packstack]# echo "192.168.122.206 demo1.osp9.pisa.com demo1" >> /etc/hosts


Error Teamviewer

Install the yum-utils package (I am not sure if yum will let you install it or complain about the dupes), then use this to clear the duplicate packages in the rpm database:
dnf install yum-utils
package-cleanup --cleandupes

