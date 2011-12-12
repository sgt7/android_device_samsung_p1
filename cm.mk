$(call inherit-product, device/samsung/galaxytab/full_galaxytab.mk)

PRODUCT_RELEASE_NAME := GalaxyTab
# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# PRODUCT_BUILD_PROP_OVERRIDES += none yet! :P

PRODUCT_NAME := cm_galaxytab
PRODUCT_DEVICE := galaxytab

