#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Inherit from AI2201 device
$(call inherit-product, device/asus/AI2201/device.mk)

# Include GSI
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := AI2201
PRODUCT_NAME := twrp_AI2201
PRODUCT_BRAND := ASUS_AI2201
PRODUCT_MODEL := ROG Phone 6
PRODUCT_MANUFACTURER := ASUS

PRODUCT_GMS_CLIENTID_BASE := android-asus

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="WW_AI2201-user 12 SKQ1.220406.001 32.2810.2209.197-0 release-keys"

BUILD_FINGERPRINT := asus/WW_AI2201/ASUS_AI2201:12/SKQ1.220406.001/32.2810.2209.197-0:user/release-keys
