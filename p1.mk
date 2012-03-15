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

DEVICE_PACKAGE_OVERLAYS := device/samsung/p1c/overlay

# Init files
PRODUCT_COPY_FILES += \
	device/samsung/p1/init.gt-p1000.rc:root/init.gt-p1000.rc \
	device/samsung/p1-common/usb.rc:root/init.gt-p1000.usb.rc \
	device/samsung/p1/ueventd.gt-p1000.rc:root/ueventd.gt-p1000.rc 

# vold
PRODUCT_COPY_FILES += \
        device/samsung/p1/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# RIL
# Permissions
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Build.prop overrides
PRODUCT_PROPERTY_OVERRIDES += \
       ro.telephony.call_ring.multiple=false \
       ro.telephony.call_ring.delay=3000 \
       ro.telephony.call_ring.absent=true \
       mobiledata.interfaces=pdp0,eth0,gprs,ppp0 \
       ro.telephony.ril.v3=datacall,icccardstatus \
       ro.telephony.ril_class=SamsungRIL \
       ro.ril.enable.managed.roaming=1 \
       ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
       ro.ril.emc.mode=2 \
       ro.sf.hwrotation=90

# Kernel modules
PRODUCT_COPY_FILES += $(foreach module,\
	$(wildcard device/samsung/p1/*.ko),\
	$(module):system/lib/modules/$(notdir $(module)))

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/samsung/p1/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Inherit P1 common device configuration.
$(call inherit-product, device/samsung/p1-common/device_base.mk)

# Propreitary drivers
$(call inherit-product-if-exists, vendor/samsung/p1/p1-vendor.mk)
