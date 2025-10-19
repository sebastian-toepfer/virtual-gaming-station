#!/bin/sh

if [ -n "${1}" ];
then
  for device in /run/libvirt/usb/${1}/*.xml;
  do
    device_id=$(basename -- ${device%.xml}) 
    /usr/local/bin/libvirt_attach_usbdev_to.sh ${1} ${device_id}
  done
fi

