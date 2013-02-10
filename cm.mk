#
# CyanogenMod product configuration
#

# --------------------------------------------------------------------------------
# Inherit CM stuff
# --------------------------------------------------------------------------------

$(call inherit-product, vendor/cm/config/gsm.mk)
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration.
$(call inherit-product, device/samsung/p1/full_p1.mk)

# kernel
TARGET_KERNEL_SOURCE := kernel/samsung/aries
TARGET_KERNEL_CONFIG := cyanogenmod_p1_defconfig

PRODUCT_NAME := cm_p1
