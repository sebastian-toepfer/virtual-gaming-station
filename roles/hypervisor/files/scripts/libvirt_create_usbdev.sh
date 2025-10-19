#!/bin/sh

if [ -n "$1" ];
then
  BASE_DIR="/run/libvirt/usb/$1"
  mkdir -p $BASE_DIR
  TEMPLATE="/etc/libvirt/devices/$1/usb/$2"
  LIBVIRT_USB_DEV_DEF=$BASE_DIR/$2.xml

  if [ -f $TEMPLATE ] && [ ! -f $LIBVIRT_USB_DEV_DEF ];
  then
    sed "s/\$bus/$3/" $TEMPLATE | sed "s/\$devnum/$4/" > $LIBVIRT_USB_DEV_DEF
  fi
fi

