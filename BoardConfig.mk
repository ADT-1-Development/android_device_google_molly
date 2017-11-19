# Copyright (C) 2014 The Android Open Source Project
# Copyright (C) 2014-2018 ADT-1 Development
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

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a15

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_TINY_ALSA_AUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MRVL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/google/molly/bluetooth

# Board
TARGET_BOOTLOADER_BOARD_NAME := molly
TARGET_BOARD_PLATFORM := tegra4
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Camera
USE_CAMERA_STUB := true

# Fonts (includes additional fonts)
EXTENDED_FONT_FOOTPRINT := true

# Graphics
USE_OPENGL_RENDERER := true
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 1

# Kernel
BOARD_KERNEL_CMDLINE :=  androidboot.hardware=molly console=ttyFIQ0 smsc95xx.boot_wol_config=0x07 smsc95xx.turbo_mode=N androidboot.selinux=permissive
TARGET_KERNEL_SOURCE := kernel/google/molly
TARGET_KERNEL_CONFIG := lineageos_molly_defconfig
KERNEL_TOOLCHAIN_PREFIX := arm-eabi-
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-eabi-4.8/bin

# Malloc memory configuration
MALLOC_SVELTE := true

# Partition
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 734003200
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10800000 #8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13912506368
BOARD_FLASH_BLOCK_SIZE := 4096

# Recovery
BOARD_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD -DDISABLE_ASHMEM_TRACKING
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TARGET_RECOVERY_DEVICE_DIRS += device/google/molly
TARGET_RECOVERY_FSTAB := device/google/molly/rootdir/etc/fstab.molly

# Selinux
BOARD_SEPOLICY_DIRS := \
    device/google/molly/sepolicy

# Wifi related defines
BOARD_HAVE_MARVELL_WIFI          := true
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mrvl
BOARD_WLAN_DEVICE                := mrvl
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_mrvl
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/mrvl/sd8797_uapsta.bin"
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/mrvl/sd8797_uapsta.bin"
