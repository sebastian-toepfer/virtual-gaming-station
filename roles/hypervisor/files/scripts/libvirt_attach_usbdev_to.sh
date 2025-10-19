#!/bin/sh

if [ -n "${1}" ];
then
  LIBVIRT_DEV_USB_DEF="/run/libvirt/usb/${1}/${2}.xml"
  LIBVIRT_DEV_USB_ATTACHED=${LIBVIRT_DEV_USB_DEF}.attached

  /usr/bin/systemd-inhibit --list | grep -q "VM:${1}"

  if [ $? -eq 0 ] && [ -f ${LIBVIRT_DEV_USB_DEF} ] && [ ! -f ${LIBVIRT_DEV_USB_ATTACHED} ];
  then
    virsh attach-device ${1} ${LIBVIRT_DEV_USB_DEF} >/dev/null 2>&1
    ln ${LIBVIRT_DEV_USB_DEF} ${LIBVIRT_DEV_USB_ATTACHED}
  fi
fi

