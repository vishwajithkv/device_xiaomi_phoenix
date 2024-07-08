#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from phoenix device
$(call inherit-product, device/xiaomi/phoenix/device.mk)

# Inherit some common Pixel-Project stuff.
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

#Flags for Pixel-Project
TARGET_BOOT_ANIMATION_RES := 1080
USE_PIXEL_CHARGER = true
TARGET_INCLUDE_LIVE_WALLPAPERS=true
TARGET_SUPPORTS_GOOGLE_RECORDER=true
TARGET_FACE_UNLOCK_SUPPORTED := true

PRODUCT_NAME := aosp_phoenix
PRODUCT_DEVICE := phoenix
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi K30
PRODUCT_MANUFACTURER := Xiaomi
