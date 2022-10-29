# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),ASUS_AI2201)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif

# A/B support
AB_OTA_UPDATER := true

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 31

# A/B updater updatable partitions list.
AB_OTA_PARTITIONS ?= boot vendor_boot recovery vendor vendor_dlkm odm dtbo vbmeta

# Set GRF/Vendor freeze properties
BOARD_SHIPPING_API_LEVEL := 31
BOARD_API_LEVEL := 31
SHIPPING_API_LEVEL := 31
PRODUCT_SHIPPING_API_LEVEL := 31

#Support to compile recovery without msm headers
TARGET_HAS_GENERIC_KERNEL_HEADERS := true

# tell update_engine to not change dynamic partition table during updates
# needed since our qti_dynamic_partitions does not include
# vendor and odm and we also dont want to AB update them
TARGET_ENFORCE_AB_OTA_PARTITION_LIST := true

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# fastbootd
PRODUCT_PACKAGES += fastbootd

# Add default implementation of fastboot HAL.
PRODUCT_PACKAGES += android.hardware.fastboot@1.1-impl-mock

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

#namespace definition for librecovery_updater
#differentiate legacy 'sg' or 'bsg' framework
SOONG_CONFIG_NAMESPACES += ufsbsg

SOONG_CONFIG_ufsbsg += ufsframework
SOONG_CONFIG_ufsbsg_ufsframework := bsg

# OEM otacerts
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(LOCAL_PATH)/security/otacert


# Enable Fuse Passthrough
PRODUCT_PROPERTY_OVERRIDES += persist.sys.fuse.passthrough.enable=true

# Copy modules for depmod
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*.ko,$(LOCAL_PATH)/prebuilt/modules,$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1)

