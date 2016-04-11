#!/bin/bash

pvdisplay | grep '/dev/sdb'

if [ $? != 0 ]; then
  sudo pvcreate /dev/sdb
  sudo vgextend rootvg /dev/sdb
  EXTENTS=`sudo pvdisplay /dev/sdb -c | cut -d: -f10`
  sudo lvextend -l +$EXTENTS /dev/rootvg/vol_root
  sudo resize2fs /dev/mapper/rootvg-vol_root
fi

