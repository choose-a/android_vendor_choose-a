
# Copyright (C) 2016 The Sony AOSP Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# vendor path
VENDOR_SONYAOSP_PATH := vendor/google

# OpenGapps
GAPPS_VARIANT := nano
GAPPS_FORCE_PACKAGE_OVERRIDES := true
GAPPS_FORCE_WEBVIEW_OVERRIDES := true
GAPPS_FORCE_BROWSER_OVERRIDES := true
GAPPS_FORCE_PIXEL_LAUNCHER := true

# Google Assistant
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opa.eligible_device=true

# Add some extras not in micro
# To override stock AOSP apps
PRODUCT_PACKAGES += \
    GoogleContacts \
    LatinImeGoogle

$(call inherit-product, vendor/google/opengapps/opengapps-packages.mk)
