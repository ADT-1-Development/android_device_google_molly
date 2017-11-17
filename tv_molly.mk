#
# Copyright (C) 2014 The Android Open-Source Project
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
#

$(call inherit-product, device/google/molly/device.mk)
$(call inherit-product, device/google/atv/products/atv_base.mk)

# Device Type
PRODUCT_CHARACTERISTICS := tv,nosdcard

# DPI
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320

# Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/com.google.android.tv.installed.xml:system/etc/permissions/com.google.android.tv.installed.xml \
    $(LOCAL_PATH)/permissions/tv_molly.xml:system/etc/permissions/tv_molly.xml

# TV-specific Apps/Packages
PRODUCT_PACKAGES += \
    AppDrawer \
    LeanbackCustomizer \
    LeanbackLauncher \
    LeanbackIme \
    TvProvider \
    tv_input.default \
    TV \
    TvSettings

PRODUCT_NAME := tv_molly
PRODUCT_DEVICE := molly
PRODUCT_BRAND := google
PRODUCT_MODEL := ADT-1
PRODUCT_MANUFACTURER := Google

PRODUCT_RELEASE_NAME := molly

TARGET_VENDOR_PRODUCT_NAME := molly
TARGET_VENDOR_DEVICE_NAME := molly

TARGET_VENDOR := google

# Device Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=molly \
    BUILD_FINGERPRINT=google/molly/molly:5.0.2/LRX22G/1649326:user/release-keys \
    PRIVATE_BUILD_DESC="molly-user 5.0.2 LRX22G 1649326 release-keys"

$(call inherit-product-if-exists, vendor/google/molly/molly-vendor.mk)
