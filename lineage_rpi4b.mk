#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit from rpi4b device
$(call inherit-product, device/rpi/rpi4b/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

PRODUCT_NAME := lineage_rpi4b
PRODUCT_DEVICE := rpi4b
PRODUCT_MANUFACTURER := rpi
PRODUCT_BRAND := RaspberryPi
PRODUCT_MODEL := 4 Model B
