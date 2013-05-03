#!/tmp/busybox sh
#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#
HW=`/tmp/busybox cat /proc/cpuinfo | /tmp/busybox grep Hardware | /tmp/busybox sed s/Hardware// | /tmp/busybox tr '[A-Z]' '[a-z]' | /tmp/busybox tr -d ' ' | /tmp/busybox tr -d ':' | /tmp/busybox tr -d '\t'`
DEVICE=`/tmp/busybox cat /default.prop | /tmp/busybox grep ro.cm.device | /tmp/busybox sed s#ro\.cm\.device=## | /tmp/busybox tr '[A-Z]' '[a-z]'`

# Set GT-P1000 as default variant
model=p1

case $HW in
	p1l|gt-p1000l)
		model=p1ln
	;;
	p1n|gt-p1000n)
		model=p1ln
	;;
	p1ln|gt-p1000n|gt-p1000l)
		model=p1ln
	;;
esac

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

if [ "$model" != "p1" ] ; then
	/tmp/busybox rm /tmp/boot.img
	/tmp/busybox mv /tmp/boot_$model.img /tmp/boot.img
fi

exit 0
