cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-eth0.100
DEVICE=eth0.100
BOOTPROTO=none
ONBOOT=yes
IPADDR=10.1.1.1
PREFIX=24
NETWORK=10.1.1.0
VLAN=yes
EOF

cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-eth0.201
DEVICE=eth0.201
BOOTPROTO=none
ONBOOT=yes
IPADDR=172.16.0.1
PREFIX=24
NETWORK=172.16.0.0
VLAN=yes
EOF

cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-eth0.202
DEVICE=eth0.202
BOOTPROTO=none
ONBOOT=yes
IPADDR=172.17.0.1
PREFIX=24
NETWORK=172.17.0.0
VLAN=yes
EOF

cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-eth0.203
DEVICE=eth0.203
BOOTPROTO=none
ONBOOT=yes
IPADDR=172.18.0.1
PREFIX=24
NETWORK=172.18.0.0
VLAN=yes
EOF

cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-eth0.204
DEVICE=eth0.204
BOOTPROTO=none
ONBOOT=yes
IPADDR=172.19.0.1
PREFIX=24
NETWORK=172.19.0.0
VLAN=yes
EOF

cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-eth0.205
DEVICE=eth0.205
BOOTPROTO=none
ONBOOT=yes
IPADDR=172.20.0.1
PREFIX=24
NETWORK=172.20.0.0
VLAN=yes
EOF
