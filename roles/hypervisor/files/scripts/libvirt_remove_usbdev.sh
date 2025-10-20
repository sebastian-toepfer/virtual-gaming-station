#!/bin/sh

PORT=$(echo $1 | rev | cut -d / -f1 | cut -d - -f1 | rev)
for vm in /run/libvirt/usb/*;
do
  /usr/local/bin/libvirt_remove_usbdev_from.sh $(basename $vm) $1
done

