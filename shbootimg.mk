LOCAL_PATH := $(call my-dir)

INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.img
$(INSTALLED_BOOTIMAGE_TARGET): $(TARGET_PREBUILT_KERNEL) $(recovery_ramdisk) $(INSTALLED_RAMDISK_TARGET) $(PRODUCT_OUT)/utilities/flash_image $(PRODUCT_OUT)/utilities/busybox $(PRODUCT_OUT)/utilities/make_ext4fs $(PRODUCT_OUT)/utilities/erase_image $(PRODUCT_OUT)/modem.bin
	$(call pretty,"Boot image: $@")
	$(hide) ./device/samsung/galaxytab/mkshbootimg.py $@ $(TARGET_PREBUILT_KERNEL) $(INSTALLED_RAMDISK_TARGET) $(recovery_ramdisk)

$(INSTALLED_RECOVERYIMAGE_TARGET): $(INSTALLED_BOOTIMAGE_TARGET)
	$(ACP) $(INSTALLED_BOOTIMAGE_TARGET) $@

PRODUCT_COPY_FILES += vendor/samsung/$(TARGET_DEVICE)/proprietary/modem.bin:modem.bin

include $(CLEAR_VARS)
LOCAL_MODULE := modem.bin
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(PRODUCT_OUT)
LOCAL_SRC_FILES := ../../../vendor/samsung/$(TARGET_DEVICE)/proprietary/modem.bin
include $(BUILD_PREBUILT)
