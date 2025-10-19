#!/bin/sh

for vm in /run/libvirt/usb/*;
do
  /usr/local/bin/libvirt_remove_usbdev.sh $(basename $vm) $1
done

