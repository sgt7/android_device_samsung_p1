ifneq ($(BOARD_USES_BML_OVER_MTD),true)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := bmlwrite
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(PRODUCT_OUT)/utilities
LOCAL_SRC_FILES := bmlwrite.c
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_STATIC_LIBRARIES += libstdc++ libc
include $(BUILD_EXECUTABLE)

endif
