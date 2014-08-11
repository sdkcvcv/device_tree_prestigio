# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

USE_CAMERA_STUB := true

DEVICE_FOLDER := device/prestigio/pap4322duo

-include vendor/prestigio/pap4322duo/BoardConfigVendor.mk

# board
TARGET_BOARD_PLATFORM := mt6577
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_NEON := true

# blob hacks
COMMON_GLOBAL_CFLAGS += -DMR1_AUDIO_BLOB -DDISABLE_HW_ID_MATCH_CHECK -DNEEDS_VECTORIMPL_SYMBOLS
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# power
TARGET_POWERHAL_VARIANT := cm

#gfx
MTK_HWC_CHIP := mt6577
MTK_HWC_SUPPORT := true
MTK_WFD_SUPPORT := true
MTK_PQ_SUPPORT := true
MTK_ION_SUPPORT := true

#camera

# boot
TARGET_NO_BOOTLOADER := true
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_FOLDER)/boot.mk

# EGL settings
BOARD_EGL_CFG := device/prestigio/pap4322duo/egl.cfg
USE_OPENGL_RENDERER := true

# audio
TARGET_PROVIDES_LIBAUDIO := true
BOARD_USES_MTK_AUDIO := true

# Some framework code requires this to enable BT
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/prestigio/pap4322duo/bluetooth

# kernel
TARGET_PREBUILT_KERNEL := $(DEVICE_FOLDER)/prebuilt/kernel

# init
#TARGET_PROVIDES_INIT_RC := true
#HAVE_AEE_FEATURE := yes
BUILD_MTK_INIT := true
MTK_KERNEL_POWER_OFF_CHARGING := true


# adb has root
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0  # debug
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0  # debug
ADDITIONAL_DEFAULT_PROPERTIES += ro.allow.mock.location=1
ADDITIONAL_DEFAULT_PROPERTIES += persist.mtk.aee.aed=on
ADDITIONAL_DEFAULT_PROPERTIES += persist.service.adb.enable=1
ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.usb.config=mass_storage,adb
ADDITIONAL_DEFAULT_PROPERTIES += ro.mount.fs=EXT4

# partition info
BOARD_BOOTIMAGE_PARTITION_SIZE := 6291456
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 618659840
BOARD_USERDATAIMAGE_PARTITION_SIZE := 825229312
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 6291456
BOARD_KERNEL_PAGESIZE := 2048
BOARD_FLASH_BLOCK_SIZE := 512
TARGET_USERIMAGES_USE_EXT4 := true

# recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_FOLDER)/recovery/recovery.fstab
TARGET_PREBUILT_RECOVERY_KERNEL := $(DEVICE_FOLDER)/recovery/kernel
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/prestigio/pap4322duo/recovery/recovery_keys.c
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
BOARD_HAS_NO_SELECT_BUTTON := true

# patches from C3C0
CWM_EMMC_BOOT_DEVICE_NAME := /dev/bootimg
CWM_EMMC_BOOT_DEVICE_SIZE := 0x00600000 # 6291456 bytes
CWM_EMMC_RECOVERY_DEVICE_NAME := /dev/recovery
CWM_EMMC_RECOVERY_DEVICE_SIZE := 0x00600000 # 6291456 bytes
CWM_EMMC_UBOOT_DEVICE_NAME := /dev/uboot
CWM_EMMC_UBOOT_DEVICE_SIZE := 0x00060000 # 393216 bytes (from scatter file)
# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/gadget/lun%d/file

# wifi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mtk
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_mtk

# dummy FW paths to trigger libhardware_legacy/wifi FW switch throuh hald
WIFI_DRIVER_FW_PATH_AP := "AP"
WIFI_DRIVER_FW_PATH_STA := "STA"
WIFI_DRIVER_FW_PATH_P2P := "STA+P2P"

# telephony
BOARD_RIL_CLASS := ../../../device/prestigio/pap4322duo/ril/



