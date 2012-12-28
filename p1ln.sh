#!/tmp/busybox sh
#
# Setting the GSM Kernel Samsung Galaxy Tab 7"
# (c) 2012 by SGT7 TE4M
#------------------------------------------------------------------------
HW=`/tmp/busybox cat /proc/cpuinfo | /tmp/busybox grep Hardware | /tmp/busybox sed s/Hardware// | /tmp/busybox tr '[A-Z]' '[a-z]' | /tmp/busybox tr -d ' ' | /tmp/busybox tr -d ':' | /tmp/busybox tr -d '\t'`
DEVICE=`/tmp/busybox cat /default.prop | /tmp/busybox grep ro.cm.device | /tmp/busybox sed s#ro\.cm\.device=## | /tmp/busybox tr '[A-Z]' '[a-z]'`
#------------------------------------------------------------------------
# Set GT-P1000 as default variant
#------------------------------------------------------------------------
model=p1
#------------------------------------------------------------------------
case $HW in
	p1l|gt-p1000l)
		model=p1l
	;;
	p1n|gt-p1000n)
		model=p1n
	;;
esac
#------------------------------------------------------------------------
if [ "$model" == "p1" ] ; then
	case $DEVICE in
		p1l|p1n)
			model=$DEVICE
		;;
		*)
			/tmp/busybox echo "Invalid device: $DEVICE"
		;;
	esac
fi
#------------------------------------------------------------------------
if [ "$model" != "p1" ] ; then
	/tmp/busybox rm /tmp/boot.img
	/tmp/busybox mv /tmp/boot_$model.img /tmp/boot.img
fi

exit 0
