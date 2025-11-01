#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from mainline/common
TARGET_GRAPHICS := mesa
TARGET_GRAPHICS_ALLOCATOR_HAL := minigbm
TARGET_MINIGBM_PLATFORM := gbm_mesa
TARGET_HAS_BATTERY := false
TARGET_SUPPORTS_SUSPEND := false
TARGET_SUPPORTS_USB_ACCESSORY_MODE := false
include device/mainline/common/optional/options.mk
$(call inherit-product, device/mainline/common/mainline_common.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Boot animation
TARGET_SCREEN_WIDTH := 1920
TARGET_SCREEN_HEIGHT := 1080

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Init
PRODUCT_PACKAGES += \
    fstab.rpi \
    fstab.rpi.ramdisk

PRODUCT_PACKAGES += \
    init.rpi.rc

# Overlays
PRODUCT_PACKAGES += \
    FrameworksResDeviceOverlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/pc_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/pc_core_hardware.xml

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 36

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# VINTF
PRODUCT_HIDL_ENABLED := true

PRODUCT_PACKAGES += \
    hwservicemanager \
    vndservicemanager
