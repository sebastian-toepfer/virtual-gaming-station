#!/bin/sh

if [ -n "$1" ];
then
  LIBVIRT_USB_DEV_ATTACHED=/run/libvirt/usb/$1/$2.xml.attached


  if [ -f $LIBVIRT_USB_DEV_ATTACHED ];
  then
    /usr/bin/systemd-inhibit --list | grep -q "VM:${1}"
    if [ $? -eq 0 ];
    then
      virsh detach-device $1 $LIBVIRT_USB_DEV_ATTACHED > /dev/null 2>&1
    fi
    rm $LIBVIRT_USB_DEV_ATTACHED
  fi
fi

