#!/system/bin/sh
#
# Setup /data/data based on whether the phone is encrypted or not
# and migrate the data to the correct location on en/decryption
# Encrypted => leave on /data/data (/datadata cannot be encrypted)
# Unencrypted => symlink to /datadata for performance

PATH=/system/bin/:/system/xbin/

function migrate_datadata {
    # Migrate data from /datadata to /data/data
    if test -h /data/data ; then
        rm /data/data
        mkdir /data/data
        chown system.system /data/data
        chmod 0771 /data/data
        cp -a /datadata/* /data/data/
        touch /data/data/.nodatadata
        rm -r /data/data/lost+found
        busybox umount /datadata
        erase_image datadata
        busybox mount /datadata
    fi
}

function migrate_cache {
    if test -e /data/data/$1 ; then
        if ! test -h /data/data/$1/cache ; then
            OWNER="`ls -ld /data/data/$1/ | awk '{print $3}'`"
            rm -r /data/data2/$1 # In case it exists
            mkdir -p /data/data2/$1
            chmod 751 /data/data2/$1
            busybox mv -f /data/data/$1/cache /data/data2/$1/
            ln -s /data/data2/$1/cache /data/data/$1/cache
            chown $OWNER.$OWNER /data/data2/$1 /data/data2/$1/cache
            busybox chown -h $OWNER.$OWNER /data/data/$1/cache
        fi
    else
        # App was removed?
        rm -r /data/data2/$1
    fi
}

# There are 4 states which this script can be called from.
# They can be detected using vold.decrypt and ro.crypto.state props

CRYPTO_STATE="`getprop ro.crypto.state`"
VOLD_DECRYPT="`getprop vold.decrypt`"

if test "$CRYPTO_STATE" = "unencrypted" ; then
    if test "$VOLD_DECRYPT" = "" ; then
        # Normal unencrypted boot
        if test -e /data/data/.nodatadata ; then
            migrate_datadata
        else
            rmdir /data/data
            ln -s /datadata /data/data

            # Migrate download provider's cache out of /data/data because that's where market stores its downloads
            migrate_cache com.android.providers.downloads
            # GMail stores attachments in here
            migrate_cache com.google.android.gm
        fi
    fi
    # else: Encrypting, do nothing
else
    if test "$VOLD_DECRYPT" = "trigger_post_fs_data" ; then
        # Encrypted boot (after decryption)
        migrate_datadata
    fi
    # else: Encrypted boot (before decryption), do nothing
fi
