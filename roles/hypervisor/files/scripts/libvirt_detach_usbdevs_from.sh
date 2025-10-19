#!/bin/sh

if [ -n "${1}" ];
then
  shopt -s nullglob
  for device in /run/libvirt/usb/${1}/*.xml.attached;
  do
    device_id=$(basename -- ${device%.xml.attached})
    /usr/local/bin/libvirt_detach_usbdev_from.sh ${1} ${device_id}
  done
fi
 
