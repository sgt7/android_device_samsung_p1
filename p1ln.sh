HW=$(getprop ro.hardware | tr '[A-Z]' '[a-z]')
DEVICE=$(getprop ro.product.device | tr '[A-Z]' '[a-z]')

case $HW in
p1|gt-p1000)
model=p1
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

if [ "$model" == "p1" ]
case $DEVICE in
p1|gt-p1000|galaxytab)
;;
p1l|gt-p1000l)
model=p1l
;;
p1n|gt-p1000n)
model=p1n
;;
*)
echo "Invalid device: $DEVICE"
;;
esac

mv /tmp/boot_$model.img /tmp/boot.img

exit 0
