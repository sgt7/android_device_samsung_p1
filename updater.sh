#!/tmp/busybox sh
#
# Filsystem Conversion Script for Samsung Galaxy Tab
# (c) 2011 by Teamhacksung
#

set -x
export PATH=/:/sbin:/system/xbin:/system/bin:/tmp:$PATH

# unmount everything
/tmp/busybox umount -l /system
/tmp/busybox umount -l /cache
/tmp/busybox umount -l /data
/tmp/busybox umount -l /dbdata

# create directories
/tmp/busybox mkdir -p /system
/tmp/busybox mkdir -p /cache
/tmp/busybox mkdir -p /data
/tmp/busybox mkdir -p /dbdata

# make sure sdcard is mounted
if ! /tmp/busybox grep -q /sdcard /proc/mounts ; then
    /tmp/busybox mkdir -p /sdcard
    /tmp/busybox umount -l /dev/block/mmcblk1p1
    if ! /tmp/busybox mount -t vfat /dev/block/mmcblk1p1 /sdcard ; then
        /tmp/busybox echo "Cannot mount sdcard."
        exit 1
    fi
fi

# remove old log
rm -rf /sdcard/cyanogenmod.log

# everything is logged into /sdcard/cyanogenmod.log
exec >> /sdcard/cyanogenmod.log 2>&1

#
# flash kernel and recovery
#
/tmp/bmlwrite /tmp/boot.img /dev/block/bml7
/tmp/bmlwrite /tmp/boot.img /dev/block/bml8

#
# filesystem conversion
#

# format system if not ext4
if ! /tmp/busybox mount -t ext4 /dev/block/stl9 /system ; then
    /tmp/busybox umount /system
    /tmp/make_ext4fs -b 4096 -g 32768 -i 8192 -I 256 -a /system /dev/block/stl9
fi

# format cache if not ext4
if ! /tmp/busybox mount -t ext4 /dev/block/mmcblk0p1 /cache ; then
    /tmp/busybox umount /cache
    /tmp/make_ext4fs -b 4096 -g 32768 -i 8192 -I 256 -a /cache dev/block/mmcblk0p1
fi

# format data if not ext4
if ! /tmp/busybox mount -t ext4 /dev/block/mmcblk0p2 /data ; then
    /tmp/busybox umount /data
    /tmp/make_ext4fs -b 4096 -g 32768 -i 8192 -I 256 -a /data /dev/block/mmcblk0p2
fi

# format dbdata if not ext4
if ! /tmp/busybox mount -t ext4 /dev/block/stl10 /dbdata ; then
    /tmp/busybox umount /dbdata
    /tmp/make_ext4fs -b 4096 -g 32768 -i 8192 -I 256 -a /dbdata /dev/block/stl10
fi

# unmount everything
/tmp/busybox umount -l /system
/tmp/busybox umount -l /cache
/tmp/busybox umount -l /data
/tmp/busybox umount -l /dbdata

exit 0
