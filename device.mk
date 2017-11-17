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
$(call inherit-product-if-exists, vendor/google/molly/molly-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/google/molly/overlay

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

# Codecs
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_tv.xml:system/etc/media_codecs_google_tv.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true \
    ro.com.widevine.cachesize=16777216

# GL Compatibillity with 6.0.y and above
PRODUCT_PACKAGES += \
    libmhax

#  OpenGL ES 2.0
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

# Power HAL
PRODUCT_PACKAGES += \
    power.molly

# Stagefright
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.cache-params=10240/20480/15 \
    persist.sys.media.avsync=true \
    media.aac_51_output_enabled=true

# Wifi
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    hostapd \
    libwpa_client \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf


PRODUCT_PROPERTY_OVERRIDES += wifi.interface=wlan0
