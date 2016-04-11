#!/bin/bash

pvdisplay | grep '/dev/sda'

if [ $? != 0 ]; then
  sudo pvcreate /dev/sda
  sudo vgextend VolGroup /dev/sda
  EXTENTS=`sudo pvdisplay /dev/sda -c | cut -d: -f10`
  sudo lvextend -l +100G /dev/mapper/VolGroup/lv_root
  sudo resize2fs /dev/mapper/VolGroup-lv_root
fi

