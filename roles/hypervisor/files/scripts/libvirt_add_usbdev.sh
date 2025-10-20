#!/bin/sh

for vm in /etc/libvirt/devices/*;
do
  vm_name=$(basename -- $vm)
  BUSNUM=$((10#$1))
  DEVNUM=$((10#$3))
  /usr/local/bin/libvirt_create_usbdev.sh $vm_name $2 $BUSNUM $DEVNUM >/dev/null 2>&1
  /usr/local/bin/libvirt_attach_usbdev_to.sh $vm_name $2 >/dev/null 2>&1
done

