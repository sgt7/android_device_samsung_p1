#!/bin/sh

# Copyright (C) 2010 The Android Open Source Project
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

DEVICE=galaxytab
MANUFACTURER=samsung

rm -rf ../../../vendor/$MANUFACTURER/$DEVICE
mkdir -p ../../../vendor/$MANUFACTURER/$DEVICE/proprietary

# vzwtab
adb pull /system/lib/libril.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libsecril-client.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libsec-ril40.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/bin/rild ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/hw/gps.s5pc110.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/vendor/bin/gpsd ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/etc/gps.conf ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libcamera.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/hw/sensors.s5pc110.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/hw/copybit.s5pc110.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary

adb pull /system/etc/wifi/nvram_net.txt ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/etc/wifi/nvram_mfg.txt ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/etc/wifi/bcm4329_aps.bin ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/etc/wifi/bcm4329_mfg.bin ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/etc/wifi/bcm4329_sta.bin ../../../vendor/$MANUFACTURER/$DEVICE/proprietary

adb pull /system/bin/BCM4329B1_002.002.023.0534.0571.hcd ../../../vendor/$MANUFACTURER/$DEVICE/proprietary

# aries-common
adb pull /system/bin/pvrsrvinit ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/egl/libGLES_android.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/egl/libEGL_POWERVR_SGX540_120.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/egl/libGLESv2_POWERVR_SGX540_120.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/hw/gralloc.s5pc110.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libakm.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libglslcompiler.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libIMGegl.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libpvr2d.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libpvrANDROID_WSEGL.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libPVRScopeServices.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libsrv_init.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libsrv_um.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libusc.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libarccamera.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libcamera_client.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libcameraservice.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libCaMotion.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libcaps.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libddc.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libedid.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libPanoraMax1.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libs3cjpeg.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libseccamera.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libseccameraadaptor.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libtvout.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/lib_tvoutengine.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libtvoutfimc.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libtvouthdmi.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/lib/libtvoutservice.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/bin/tvoutserver ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/cameradata/datapattern_420sp.yuv ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/cameradata/datapattern_front_420sp.yuv ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/cameradata/datapattern_420sp_s5k5ccgx.yuv ../../../vendor/$MANUFACTURER/$DEVICE/proprietary

adb pull /system/bin/charging_mode ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/charging_mode
adb pull /system/bin/playlpm ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/playlpm
adb pull /system/lib/libQmageDecoder.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/libQmageDecoder.so
adb pull /system/media/battery_charging_10.qmg ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/battery_charging_10.qmg
adb pull /system/media/battery_charging_100.qmg ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/battery_charging_100.qmg
adb pull /system/media/battery_charging_15.qmg ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/battery_charging_15.qmg
adb pull /system/media/battery_charging_20.qmg ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/battery_charging_20.qmg
adb pull /system/media/battery_charging_25.qmg ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/battery_charging_25.qmg
adb pull /system/media/battery_charging_30.qmg ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/battery_charging_30.qmg
adb pull /system/media/battery_charging_35.qmg ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/battery_charging_35.qmg
adb pull /system/media/battery_charging_40.qmg ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/battery_charging_40.qmg
adb pull /system/media/battery_charging_45.qmg ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/battery_charging_45.qmg
adb pull /system/media/battery_charging_5.qmg ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/battery_charging_5.qmg
adb pull /system/media/battery_charging_50.qmg ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/battery_charging_50.qmg
adb pull /system/media/battery_charging_55.qmg ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/battery_charging_55.qmg
adb pull /system/media/battery_charging_60.qmg ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/battery_charging_60.qmg
adb pull /system/media/battery_charging_65.qmg ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/battery_charging_65.qmg
adb pull /system/media/battery_charging_70.qmg ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/battery_charging_70.qmg
adb pull /system/media/battery_charging_75.qmg ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/battery_charging_75.qmg
adb pull /system/media/battery_charging_80.qmg ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/battery_charging_80.qmg
adb pull /system/media/battery_charging_85.qmg ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/battery_charging_85.qmg
adb pull /system/media/battery_charging_90.qmg ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/battery_charging_90.qmg
adb pull /system/media/battery_charging_95.qmg ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/battery_charging_95.qmg
adb pull /system/media/chargingwarning_disconnected.qmg ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/media/chargingwarning_temp.qmg ../../../vendor/$MANUFACTURER/$DEVICE/proprietary
adb pull /system/media/usb_not_charging.qmg ../../../vendor/$MANUFACTURER/$DEVICE/proprietary


(cat << EOF) | sed s/__DEVICE__/$DEVICE/g | sed s/__MANUFACTURER__/$MANUFACTURER/g > ../../../vendor/$MANUFACTURER/$DEVICE/$DEVICE-vendor-blobs.mk
# Copyright (C) 2010 The Android Open Source Project
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

# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES := \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libril.so:obj/lib/libril.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libsecril-client.so:obj/lib/libsecril-client.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libcamera.so:obj/lib/libcamera.so


# All the blobs necessary for galaxys devices
PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libril.so:system/lib/libril.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libsecril-client.so:system/lib/libsecril-client.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libsec-ril40.so:system/lib/libsec-ril40.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/gps.s5pc110.so:system/lib/hw/gps.s5pc110.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/sensors.s5pc110.so:system/lib/hw/sensors.s5pc110.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/rild:system/bin/rild \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/gpsd:system/vendor/bin/gpsd \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/gps.conf:system/etc/gps.conf \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libcamera.so:system/lib/libcamera.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/copybit.s5pc110.so:system/lib/hw/copybit.s5pc110.so

# All the blobs necessary for galaxys devices
PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/pvrsrvinit:system/bin/pvrsrvinit \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libGLES_android.so:system/lib/egl/libGLES_android.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libEGL_POWERVR_SGX540_120.so:system/lib/egl/libEGL_POWERVR_SGX540_120.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libGLESv1_CM_POWERVR_SGX540_120.so:system/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libGLESv2_POWERVR_SGX540_120.so:system/lib/egl/libGLESv2_POWERVR_SGX540_120.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/gralloc.s5pc110.so:system/lib/hw/gralloc.s5pc110.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libakm.so:system/lib/libakm.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libglslcompiler.so:system/lib/libglslcompiler.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libIMGegl.so:system/lib/libIMGegl.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libpvr2d.so:system/lib/libpvr2d.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libpvrANDROID_WSEGL.so:system/lib/libpvrANDROID_WSEGL.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libPVRScopeServices.so:system/lib/libPVRScopeServices.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libsrv_init.so:system/lib/libsrv_init.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libsrv_um.so:system/lib/libsrv_um.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libusc.so:system/lib/libusc.so

# camera and tvout
PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libarccamera.so:system/lib/libarccamera.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libcamera_client.so:system/lib/libcamera_client.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libcameraservice.so:system/lib/libcameraservice.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libCaMotion.so:system/lib/libCaMotion.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libcaps.so:system/lib/libcaps.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libddc.so:system/lib/libddc.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libedid.so:system/lib/libedid.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libPanoraMax1.so:system/lib/libPanoraMax1.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libs3cjpeg.so:system/lib/libs3cjpeg.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libseccamera.so:system/lib/libseccamera.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libseccameraadaptor.so:system/lib/libseccameraadaptor.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libtvout.so:system/lib/libtvout.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib_tvoutengine.so:system/lib/lib_tvoutengine.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libtvoutfimc.so:system/lib/libtvoutfimc.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libtvouthdmi.so:system/lib/libtvouthdmi.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libtvoutservice.so:system/lib/libtvoutservice.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/tvoutserver:system/bin/tvoutserver \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/datapattern_420sp.yuv:system/cameradata/datapattern_420sp.yuv \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/datapattern_front_420sp.yuv:system/cameradata/datapattern_front_420sp.yuv \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/datapattern_420sp_s5k5ccgx.yuv:system/cameradata/datapattern_420sp_s5k5ccgx.yuv

# wifi
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/nvram_net.txt:system/etc/wifi/nvram_net.txt \\
    vendor/samsung/__DEVICE__/proprietary/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \\
    vendor/samsung/__DEVICE__/proprietary/bcm4329_aps.bin:system/etc/wifi/bcm4329_aps.bin \\
    vendor/samsung/__DEVICE__/proprietary/bcm4329_mfg.bin:system/etc/wifi/bcm4329_mfg.bin \\
    vendor/samsung/__DEVICE__/proprietary/bcm4329_sta.bin:system/etc/wifi/bcm4329_sta.bin

# low power mode
PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/charging_mode:system/bin/charging_mode \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/playlpm:system/bin/playlpm \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libQmageDecoder.so:system/lib/libQmageDecoder.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/battery_charging_10.qmg:system/media/battery_charging_10.qmg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/battery_charging_100.qmg:system/media/battery_charging_100.qmg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/battery_charging_15.qmg:system/media/battery_charging_15.qmg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/battery_charging_20.qmg:system/media/battery_charging_20.qmg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/battery_charging_25.qmg:system/media/battery_charging_25.qmg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/battery_charging_30.qmg:system/media/battery_charging_30.qmg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/battery_charging_35.qmg:system/media/battery_charging_35.qmg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/battery_charging_40.qmg:system/media/battery_charging_40.qmg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/battery_charging_45.qmg:system/media/battery_charging_45.qmg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/battery_charging_5.qmg:system/media/battery_charging_5.qmg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/battery_charging_50.qmg:system/media/battery_charging_50.qmg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/battery_charging_55.qmg:system/media/battery_charging_55.qmg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/battery_charging_60.qmg:system/media/battery_charging_60.qmg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/battery_charging_65.qmg:system/media/battery_charging_65.qmg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/battery_charging_70.qmg:system/media/battery_charging_70.qmg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/battery_charging_75.qmg:system/media/battery_charging_75.qmg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/battery_charging_80.qmg:system/media/battery_charging_80.qmg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/battery_charging_85.qmg:system/media/battery_charging_85.qmg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/battery_charging_90.qmg:system/media/battery_charging_90.qmg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/battery_charging_95.qmg:system/media/battery_charging_95.qmg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/chargingwarning_disconnected.qmg:system/media/chargingwarning_disconnected.qmg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/chargingwarning_temp.qmg:system/media/chargingwarning_temp.qmg \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/usb_not_charging.qmg:system/media/usb_not_charging.qmg

# bluetooth
PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/BCM4329B1_002.002.023.0534.0571.hcd:system/bin/BCM4329B1_002.002.023.0534.0571.hcd

EOF


./setup-makefiles.sh
