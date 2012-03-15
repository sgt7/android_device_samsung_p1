# Release name
PRODUCT_RELEASE_NAME := GalaxyTab

# Bootanimation
TARGET_BOOTANIMATION_NAME := horizontal-1024x600

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)
# Inherit device configuration
$(call inherit-product, device/samsung/p1/full_p1.mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_p1
PRODUCT_DEVICE := p1
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := GT-P1000

# Build.prop overrides for Market Compability
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-P1000 TARGET_DEVICE=GT-P1000 BUILD_FINGERPRINT=samsung/GT-P1000/GT-P1000:2.3.5/GINGERBREAD/XXJVT:user/release-keys PRIVATE_BUILD_DESC="GT-P1000-user 2.3.5 GINGERBREAD XXJVT release-keys"
