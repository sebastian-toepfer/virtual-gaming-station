#!/bin/sh

if [ -n "${1}" ];
then
  LIBVIRT_USBDEV_DEF=/run/libvirt/usb/${1}/${2}.xml

  /usr/local/bin/libvirt_detach_usbdev_from.sh ${1} ${2}

  rm -rf ${LIBVIRT_USBDEV_DEF}
fi

