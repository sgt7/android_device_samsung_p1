$(call inherit-product, device/samsung/galaxytab/full_galaxytab.mk)

# Release name
PRODUCT_RELEASE_NAME := GalaxyTab

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)
$(call inherit-product, vendor/cm/config/gsm.mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_galaxytab
PRODUCT_DEVICE := galaxytab
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := GT-P1000

# Build.prop overrides for Market Compability
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-P1000 TARGET_DEVICE=GT-P1000 BUILD_ID=GINGERBREAD BUILD_FINGERPRINT=samsung/GT-P1000/GT-P1000:2.3.5/GINGERBREAD/XXJVT:user/release-keys PRIVATE_BUILD_DESC="GT-P1000-user 2.3.5 GINGERBREAD XXJVT release-keys"
