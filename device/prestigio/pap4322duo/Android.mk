LOCAL_PATH := $(call my-dir)
ifeq ($(TARGET_DEVICE),pap4322duo)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
