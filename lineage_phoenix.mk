#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from phoenix device
$(call inherit-product, device/xiaomi/phoenix/device.mk)

# Inherit some common RisingOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Boot Animation
TARGET_BOOT_ANIMATION_RES := 1080

# RisingOS
RISING_MAINTAINER := leoxvis(vishwajithkv)
WITH_GMS := true
TARGET_CORE_GMS := true
RISING_CHIPSET := Snapdragon730G
PRODUCT_NO_CAMERA := false
TARGET_ENABLE_BLUR := true
PRODUCT_BUILD_PROP_OVERRIDES += \
    RISING_MAINTAINER="leoxvis(vishwajithkv)"

# Device identifier
PRODUCT_NAME := lineage_phoenix
PRODUCT_DEVICE := phoenix
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi K30
PRODUCT_MANUFACTURER := Xiaomi
