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


 ----------------------------------
 
 
Applying 192.168.0.20_cinder.pp
192.168.0.20_keystone.pp:                         [ ERROR ]         
Applying Puppet manifests                         [ ERROR ]

ERROR : Error appeared during Puppet run: 192.168.0.20_keystone.pp
Error: Could not start Service[httpd]: Execution of '/usr/bin/systemctl start httpd' returned 1: Job for httpd.service failed because the control process exited with error code. See "systemctl status httpd.service" and "journalctl -xe" for details.
You will find full trace in log /var/tmp/packstack/20161102-214212-jRIhKA/manifests/192.168.0.20_keystone.pp.log
Please check log file /var/tmp/packstack/20161102-214212-jRIhKA/openstack-setup.log for more information
Additional information:

[root@ctrl ~]# systemctl status  httpd
● httpd.service - The Apache HTTP Server
   Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; vendor preset: disabled)
  Drop-In: /usr/lib/systemd/system/httpd.service.d
           └─openstack-dashboard.conf
   Active: failed (Result: exit-code) since mié 2016-11-02 21:44:35 EDT; 10min ago
     Docs: man:httpd(8)
           man:apachectl(8)
  Process: 8411 ExecStop=/bin/kill -WINCH ${MAINPID} (code=exited, status=1/FAILURE)
  Process: 8404 ExecStart=/usr/sbin/httpd $OPTIONS -DFOREGROUND (code=exited, status=1/FAILURE)
  Process: 8229 ExecStartPre=/usr/bin/python /usr/share/openstack-dashboard/manage.py compress --force (code=exited, status=0/SUCCESS)
  Process: 8189 ExecStartPre=/usr/bin/python /usr/share/openstack-dashboard/manage.py collectstatic --noinput --clear (code=exited, status=0/SUCCESS)
 Main PID: 8404 (code=exited, status=1/FAILURE)

nov 02 21:44:35 ctrl.example.com httpd[8404]: [Wed Nov 02 21:44:35.524877 2016] [so:warn] [pid 8404] AH01574: module cgi_module is already loaded, skipping
nov 02 21:44:35 ctrl.example.com httpd[8404]: [Wed Nov 02 21:44:35.525072 2016] [so:warn] [pid 8404] AH01574: module wsgi_module is already loaded, skipping
nov 02 21:44:35 ctrl.example.com httpd[8404]: [Wed Nov 02 21:44:35.547679 2016] [alias:warn] [pid 8404] AH00671: The Alias directive in /etc/httpd/conf.d/autoindex.conf at line ...rlier Alias.
nov 02 21:44:35 ctrl.example.com httpd[8404]: (98)Address already in use: AH00072: make_sock: could not bind to address [::]:443
nov 02 21:44:35 ctrl.example.com systemd[1]: httpd.service: main process exited, code=exited, status=1/FAILURE
nov 02 21:44:35 ctrl.example.com kill[8411]: kill: cannot find process ""
nov 02 21:44:35 ctrl.example.com systemd[1]: httpd.service: control process exited, code=exited status=1
nov 02 21:44:35 ctrl.example.com systemd[1]: Failed to start The Apache HTTP Server.
nov 02 21:44:35 ctrl.example.com systemd[1]: Unit httpd.service entered failed state.
nov 02 21:44:35 ctrl.example.com systemd[1]: httpd.service failed.
Hint: Some lines were ellipsized, use -l to show in full.



Hint: Some lines were ellipsized, use -l to show in full.


[root@ctrl ~]# netstat -anp | grep :443 | grep LISTEN



[root@ctrl ~]# grep -ir "^listen" /etc/httpd/*
/etc/httpd/conf/ports.conf:Listen 35357
/etc/httpd/conf/ports.conf:Listen 443
/etc/httpd/conf/ports.conf:Listen 5000
/etc/httpd/conf/ports.conf:Listen 80
/etc/httpd/conf.d/ssl.conf:Listen 443 https


comentando la línea del puerto 443
[root@ctrl ~]# vi /etc/httpd/conf.d/ssl.conf




yum groupinstall "Server with GUI"
systemctl set-default graphical.target
systemctl start graphical.target


https://access.redhat.com/solutions/187873




