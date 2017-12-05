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

# Inherit Vendor
$(call inherit-product, vendor/google/molly/molly-vendor.mk)
#Prebuilt TV Gapps
$(call inherit-product, 3rdparty/google/gms-apps/tv/gms.mk)
# Widevine L1
$(call inherit-product, vendor/google/widevine/widevine.mk)

PRODUCT_AAPT_CONFIG := normal large xlarge hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Audio
PRODUCT_PACKAGES += \
    libtinyalsa \
    audio.primary.molly \
    audio.r_submix.default \
    audio.usb.default \
    audio.a2dp.default \
    libaudiopolicymanager

USE_CUSTOM_AUDIO_POLICY := 1

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/libaudio/audio_policy.conf:system/etc/audio_policy.conf

#enable Widevine drm
PRODUCT_PROPERTY_OVERRIDES += drm.service.enabled=true
PRODUCT_PACKAGES += \
    com.google.widevine.software.drm.xml \
    com.google.widevine.software.drm \
    libdrmwvmplugin \
    libwvm \
    libWVStreamControlAPI_L1 \
    libwvdrm_L1

# Widevine shim
PRODUCT_PACKAGES += \
    libwvm_shim

# Codecs
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_tv.xml:system/etc/media_codecs_google_tv.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml

$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.wipe_on_crypt_fail=1 \
    drm.service.enabled=true \
    ro.com.widevine.cachesize=16777216

# GL Compatibillity with 6.0.y and above
PRODUCT_PACKAGES += \
    libmhax

# HDMI CEC: Molly works as a playback device (4)
PRODUCT_PROPERTY_OVERRIDES += ro.hdmi.device_type=4

# LED
PRODUCT_PACKAGES += \
    MollyLED

#  OpenGL ES 2.0
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

# Permission
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:system/etc/permissions/android.hardware.hdmi.cec.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    $(LOCAL_PATH)/permissions/com.nvidia.nvsi.xml:system/etc/permissions/com.nvidia.nvsi.xml \
    $(LOCAL_PATH)/permissions/molly_hardware.xml:system/etc/permissions/molly_hardware.xml

# Power HAL
PRODUCT_PACKAGES += \
    power.molly

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.molly \
    init.comms.rc \
    init.molly.rc \
    init.molly.usb.rc \
    init.molly.led.rc \
    ueventd.molly.rc

# Stagefright
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.cache-params=10240/20480/15 \
    persist.sys.media.avsync=true \
    media.aac_51_output_enabled=true

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Wifi
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    hostapd \
    libwpa_client \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi_loader.sh:system/bin/wifi_loader.sh \
    $(LOCAL_PATH)/wpa_supplicant.sh:system/bin/wpa_supplicant.sh \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

# Leanback Launcher
PRODUCT_PACKAGES += \
    AppDrawer \
    LeanbackLauncher \
    LeanbackCustomize \
    LeanbackIme \
    Provision \
    TvProvider \
    TvSettings \
    tv_input.default \
    TV

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    persist.sys.usb.config=mtp,adb

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.debuggable=1

