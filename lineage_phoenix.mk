#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, device/xiaomi/phoenix/device.mk)

# Inherit some common risingOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_phoenix
PRODUCT_DEVICE := phoenix
PRODUCT_BRAND := POCO
PRODUCT_MODEL := POCO X2
PRODUCT_MANUFACTURER := Xiaomi

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080
TARGET_BOOT_ANIMATION_RES := 1080

# Sign the build
-include vendor/lineage-priv/keys/keys.mk

# RisingOS
RISING_MAINTAINER := leoxvis(vishwajithkv)
RISING_CHIPSET := Snapdragon730G
PRODUCT_NO_CAMERA := true
TARGET_ENABLE_BLUR := true
PRODUCT_BUILD_PROP_OVERRIDES += \
    RISING_MAINTAINER="leoxvis(vishwajithkv)"

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
