#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator 
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
#

DEVICE_PATH := device/xiaomi/curtana

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a9
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=1 androidboot.usbcontroller=a600000.dwc3 earlycon=msm_geni_serial,0xa88000 loop.max_part=7 cgroup.memory=nokmem,nosocket androidboot.selinux=permissive androidboot.usbconfigfs=true
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_SECOND_OFFSET := 0x00f00000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMG_HEADER_VERSION := 2
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/zImage-dtb
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/xiaomi/curtana
TARGET_KERNEL_CONFIG := curtana_defconfig

# Platform
TARGET_BOARD_PLATFORM := atoll
TARGET_BOARD_PLATFORM_GPU := qcom-adreno618
TARGET_USES_UEFI := true

# Assert
TARGET_OTA_ASSERT_DEVICE := curtana

# Partitions
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728

# Super Partition - Dynamic P*
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9126805504
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := product vendor system odm

# SAR
BOARD_ROOT_EXTRA_FOLDERS := bluetooth dsp firmware persist
BOARD_SUPPRESS_SECURE_ERASE := true

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
