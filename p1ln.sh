#!/tmp/busybox sh

HW=$(cat /proc/cpuinfo | grep Hardware | sed s/Hardware// | tr '[A-Z]' '[a-z]' | tr -d ' ' | tr -d ':' | tr -d '\t')
DEVICE=$(cat /default.prop | grep ro.cm.device | sed s#ro\.cm\.device=## | tr '[A-Z]' '[a-z]')

case $HW in
p1|gt-p1000)
	model=p1
;;
p1l|gt-p1000l|p1n|gt-p1000n|p1ln)
	model=p1ln
;;
*)
echo "Invalid model: $HW"
exit 2
;;
esac

if [ "$model" == "p1" ] ; then
case $DEVICE in
p1)
;;
p1l|p1n)
	model=p1ln
;;
*)
	echo "Invalid device: $DEVICE"
;;
esac
fi

if [ "$model" != "p1" ] ; then
rm /tmp/boot.img
mv /tmp/boot_$model.img /tmp/boot.img
fi

exit 0
