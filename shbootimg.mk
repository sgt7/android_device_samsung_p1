LOCAL_PATH := $(call my-dir)

INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.img
$(INSTALLED_BOOTIMAGE_TARGET): $(TARGET_PREBUILT_KERNEL) $(recovery_ramdisk) $(INSTALLED_RAMDISK_TARGET) $(PRODUCT_OUT)/utilities/busybox $(PRODUCT_OUT)/utilities/make_ext4fs $(PRODUCT_OUT)/utilities/bmlwrite
	$(call pretty,"Boot image: $@")
	$(hide) ./device/samsung/galaxytab/mkshbootimg.py $@ $(TARGET_PREBUILT_KERNEL) $(INSTALLED_RAMDISK_TARGET) $(recovery_ramdisk)

$(INSTALLED_RECOVERYIMAGE_TARGET): $(INSTALLED_BOOTIMAGE_TARGET)
	$(ACP) $(INSTALLED_BOOTIMAGE_TARGET) $@
