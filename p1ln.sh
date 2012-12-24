HW=$(getprop ro.hardware | tr '[A-Z]' '[a-z]')
DEVICE=$(cat /default.prop | grep ro.cm.device | sed s#ro\.cm\.device=## | tr '[A-Z]' '[a-z]')

case $HW in
p1|gt-p1000)
	case $DEVICE in
	p1)
		model=p1
	;;
	p1l)
		model=p1l
	;;
	p1n)
		model=p1n
	;;
	*)
	echo "Invalid device: $DEVICE"
	;;
	esac
;;
p1l|gt-p1000l)
	model=p1l
;;
p1n|gt-p1000n)
	model=p1n
;;
*)
echo "Invalid model: $HW"
exit 2
;;
esac

if [ "$model" != "p1" ] ; then
mv /tmp/boot_$model.img /tmp/boot.img
fi

exit 0
