#
# CyanogenMod product configuration
#

# --------------------------------------------------------------------------------
# Inherit CM stuff
# --------------------------------------------------------------------------------

$(call inherit-product, vendor/cm/config/gsm.mk)
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# --------------------------------------------------------------------------------
# Inherit device configuration
# --------------------------------------------------------------------------------

$(call inherit-product, device/samsung/p1/full_p1.mk)

# --------------------------------------------------------------------------------
# override product name - the rest is already defined in full_p1.mk
# --------------------------------------------------------------------------------

PRODUCT_NAME := cm_p1
