#!/bin/sh

size_of_latest_snapshot=$(zfs list -t snapshot -H -o used -r $1 | tail -n1);
if [ "$size_of_latest_snapshot" != "0B" ];
then
  zfs snapshot $1@$(date +%Y%m%dT%H%M)
fi

