#!/bin/bash
openstack overcloud deploy --templates \
  -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
  -e /home/stack/templates/network-environment.yaml \
  -e /home/stack/templates/storage-environment.yaml \
  --control-flavor control \
  --compute-flavor compute \
  --ceph-storage-flavor ceph-storage \
  --control-scale 3 --compute-scale 2 --ceph-storage-scale 4 \
  --ntp-server pool.ntp.org \
  --neutron-network-type vxlan --neutron-tunnel-types vxlan
