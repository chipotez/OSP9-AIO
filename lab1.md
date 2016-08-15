[root@localhost ~]# hostnamectl set-hostname osp9.pisa.com
[root@localhost ~]# hostnamectl set-hostname osp9.pisa.com
[root@localhost ~]# hostnamectl --transient set-hostname osp9.pisa.com
[root@localhost ~]# echo '192.168.122.13 osp9.pisa.com' >> /etc/hosts
[root@localhost ~]# hostnamectl status
   Static hostname: osp9.pisa.com
         Icon name: computer-vm
           Chassis: vm
        Machine ID: 02f1ddb1415c4feba9880b2b8c4c5925
           Boot ID: cadd005024974ce8a05c8bed690d53da
    Virtualization: kvm
  Operating System: Red Hat Enterprise Linux Server 7.2 (Maipo)
       CPE OS Name: cpe:/o:redhat:enterprise_linux:7.2:GA:server
            Kernel: Linux 3.10.0-327.10.1.el7.x86_64
      Architecture: x86-64
      

[root@localhost ~]# subscription-manager list --all --available
[root@localhost ~]# subscription-manager subscribe --pool=8a85f98a5611056201564a9cfe6a6341
[root@localhost ~]# subscription-manager repos --list | grep -i 'Red Hat Openstack platform'
[root@localhost ~]# subscription-manager repos --list | grep 'Red Hat Enterprise Linux 7 Server' 
[root@localhost ~]# subscription-manager repos --disable=*
[root@localhost ~]# subscription-manager repos --enable=rhel-7-server-rpms --enable=rhel-7-server-extras-rpms --enable=rhel-7-server-openstack-9-rpms --enable=rhel-7-server-openstack-9-director-rpms --enable rhel-7-server-rh-common-rpms
 
[root@osp9 ~]# ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/root/.ssh/id_rsa): 
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /root/.ssh/id_rsa.
Your public key has been saved in /root/.ssh/id_rsa.pub.
The key fingerprint is:
ae:4a:4b:16:76:15:92:8d:f5:35:17:76:a7:68:a9:f4 root@osp9.pisa.com
The key's randomart image is:
+--[ RSA 2048]----+
|      .=o   o +.o|
|      o..o . * o.|
|        . o + .  |
|       . . +     |
|    o . S . E    |
|   . o .         |
|    +   .        |
|   + . .         |
|    o..          |
+-----------------+
[root@osp9 ~]# yum install openstack-packstack -y
=======================================================================================================================================
 Package                           Arquitectura  Versión                                   Repositorio                           Tamaño
=======================================================================================================================================
Instalando:
 openstack-packstack               noarch        8.0.0-4.el7ost                            rhel-7-server-openstack-9-rpms        243 k
Instalando para las dependencias:
 jbigkit-libs                      x86_64        2.0-11.el7                                rhel-7-server-rpms                     46 k
 libjpeg-turbo                     x86_64        1.2.90-5.el7                              rhel-7-server-rpms                    134 k
 libtiff                           x86_64        4.0.3-25.el7_2                            rhel-7-server-rpms                    169 k
 libwebp                           x86_64        0.3.0-3.el7                               rhel-7-server-rpms                    170 k
 openstack-packstack-puppet        noarch        8.0.0-4.el7ost                            rhel-7-server-openstack-9-rpms         18 k
 openstack-puppet-modules          noarch        1:8.1.7-2.el7ost                          rhel-7-server-openstack-9-rpms        3.2 M
 python-docutils                   noarch        0.12-0.2.20140510svn7747.el7ost           rhel-7-server-openstack-9-rpms        1.5 M
 python-netaddr                    noarch        0.7.18-1.el7ost                           rhel-7-server-openstack-9-rpms        1.3 M
 python-pillow                     x86_64        2.0.0-19.gitd1c6db8.el7                   rhel-7-server-rpms                    438 k
 ruby                              x86_64        2.0.0.598-25.el7_1                        rhel-7-server-rpms                     67 k
 ruby-irb                          noarch        2.0.0.598-25.el7_1                        rhel-7-server-rpms                     88 k
 ruby-libs                         x86_64        2.0.0.598-25.el7_1                        rhel-7-server-rpms                    2.8 M
 rubygem-bigdecimal                x86_64        1.2.0-25.el7_1                            rhel-7-server-rpms                     79 k
 rubygem-io-console                x86_64        0.4.2-25.el7_1                            rhel-7-server-rpms                     50 k
 rubygem-json                      x86_64        1.7.7-25.el7_1                            rhel-7-server-rpms                     75 k
 rubygem-psych                     x86_64        2.0.0-25.el7_1                            rhel-7-server-rpms                     77 k
 rubygem-rdoc                      noarch        4.0.0-25.el7_1                            rhel-7-server-rpms                    318 k
 rubygems                          noarch        2.0.14-25.el7_1                           rhel-7-server-rpms                    212 k

Resumen de la transacción
=======================================================================================================================================
Instalado:
  openstack-packstack.noarch 0:8.0.0-4.el7ost                                                                                          

Dependencia(s) instalada(s):
  jbigkit-libs.x86_64 0:2.0-11.el7                                       libjpeg-turbo.x86_64 0:1.2.90-5.el7                           
  libtiff.x86_64 0:4.0.3-25.el7_2                                        libwebp.x86_64 0:0.3.0-3.el7                                  
  openstack-packstack-puppet.noarch 0:8.0.0-4.el7ost                     openstack-puppet-modules.noarch 1:8.1.7-2.el7ost              
  python-docutils.noarch 0:0.12-0.2.20140510svn7747.el7ost               python-netaddr.noarch 0:0.7.18-1.el7ost                       
  python-pillow.x86_64 0:2.0.0-19.gitd1c6db8.el7                         ruby.x86_64 0:2.0.0.598-25.el7_1                              
  ruby-irb.noarch 0:2.0.0.598-25.el7_1                                   ruby-libs.x86_64 0:2.0.0.598-25.el7_1                         
  rubygem-bigdecimal.x86_64 0:1.2.0-25.el7_1                             rubygem-io-console.x86_64 0:0.4.2-25.el7_1                    
  rubygem-json.x86_64 0:1.7.7-25.el7_1                                   rubygem-psych.x86_64 0:2.0.0-25.el7_1                         
  rubygem-rdoc.noarch 0:4.0.0-25.el7_1                                   rubygems.noarch 0:2.0.14-25.el7_1                             

¡Listo!

[root@localhost ~]# packstack --gen-answer-file=/root/osp9-aio-2.txt
[root@localhost ~]# packstack --answer-file=/root/osp9-aio.txt 







