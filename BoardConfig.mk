# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from the proprietary version
-include vendor/htc/shooteru/BoardConfigVendor.mk

# inherit from common msm8660
-include device/htc/msm8660-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/htc/shooteru/BoardConfigVendor.mk

TARGET_SPECIFIC_HEADER_PATH := device/htc/shooteru/include

TARGET_BOOTLOADER_BOARD_NAME := shooteru

BOARD_KERNEL_CMDLINE := console=ttyHSL0 androidboot.hardware=shooteru no_console_suspend=1
BOARD_KERNEL_BASE := 0x48000000
BOARD_KERNEL_PAGE_SIZE := 2048 

BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := shooteru

COMMON_GLOBAL_CFLAGS += -DQCOM_ROTATOR_KERNEL_FORMATS
TARGET_USES_OVERLAY := true

BOARD_HTC_3D_SUPPORT := true

TARGET_HARDWARE_3D := true

# cat /proc/emmc
#dev:        size     erasesize name
#mmcblk0p31: 000ffa00 00000200 "misc"
#mmcblk0p21: 00fffc00 00000200 "recovery"
#mmcblk0p20: 01000000 00000200 "boot"
#mmcblk0p22: 31fffc00 00000200 "system"
#mmcblk0p24: 077fde00 00000200 "cache"
#mmcblk0p23: 4aabc400 00000200 "userdata"
#mmcblk0p27: 01400000 00000200 "devlog"
#mmcblk0p29: 00040000 00000200 "pdata"
#mmcblk0p17: 02800000 00000200 "radio"
#mmcblk0p19: 01000000 00000200 "adsp"
#mmcblk0p18: 007ffa00 00000200 "radio_config"
#mmcblk0p25: 00400000 00000200 "modem_st1"
#mmcblk0p26: 00400000 00000200 "modem_st2"

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 838859776
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1252770816
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_FLASH_BLOCK_SIZE := 262144

## Kernel Details
TARGET_KERNEL_CONFIG := shooter_u_defconfig
TARGET_KERNEL_SOURCE := kernel/htc/shooteru
TARGET_PREBUILT_KERNEL := device/htc/shooteru/prebuilt/zImage

TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_UI_LIB := librecovery_ui_shooteru
TARGET_RECOVERY_INITRC := device/htc/shooteru/recovery/init.rc
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk1
BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p2
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true

TARGET_ARCH_VARIANT_CPU := cortex-a9

# Scorpion optimizations
TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true
TARGET_USE_SCORPION_PLD_SET := true
TARGET_SCORPION_BIONIC_PLDOFFS := 6
TARGET_SCORPION_BIONIC_PLDSIZE := 128

# Audio
COMMON_GLOBAL_CFLAGS += -DQCOM_ACDB_ENABLED -DQCOM_VOIP_ENABLED 
COMMON_GLOBAL_CFLAGS += -DQCOM_HTC_AUDIO

# Camera
TARGET_DISABLE_ARM_PIE := true
BOARD_CAMERA_USE_MM_HEAP := true
COMMON_GLOBAL_CFLAGS += -DHTC_CAMERA
DYNAMIC_SHARED_LIBV8SO := true

# Graphics / Video
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60 -DNO_QCOM_MVS -DNO_HW_VSYNC

# -DQCOM_TUNNEL_LPA_ENABLED 
TARGET_USES_QCOM_LPA := true
COMMON_GLOBAL_CFLAGS += -DWITH_QCOM_LPA -DQCOM_ICS_LPA_COMPAT
COMMON_GLOBAL_CFLAGS += -DQCOM_ACDB_ENABLED -DQCOM_VOIP_ENABLED -DQCOM_HTC_AUDIO

# Stagefright
COMMON_GLOBAL_CFLAGS += -DQCOM_ICS_DECODERS

# Graphics
TARGET_HAVE_BYPASS := false
TARGET_USES_OVERLAY := true
TARGET_QCOM_HDMI_OUT := true
TARGET_QCOM_HDMI_RESOLUTION_AUTO := true

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true

# Custom LUN File Path
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun0/file

# Wifi
WIFI_BAND                        := 802_11_ABG
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
BOARD_HOSTAPD_DRIVER             := WEXT
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_wext
BOARD_WLAN_DEVICE                := bcm4329
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcm4329/parameters/firmware_path"
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_MODULE_NAME          := "bcm4329"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/vendor/firmware/fw_bcm4329.bin nvram_path=/proc/calibration iface_name=wlan"
BOARD_WLAN_DEVICE_REV            := bcm4329

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true

# Custom LUN File Path
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun0/file

TARGET_EXTRA_CFLAGS += $(call cc-option,-mtune=cortex-a9,$(call cc-option,-mtune=cortex-a8)) $(call cc-option,-mcpu=cortex-a9,$(call cc-option,-mcpu=cortex-a8))

