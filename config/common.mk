PRODUCT_BRAND ?= choose-a

# Bootanimation
ifneq ($(filter kugo lilac,$(TARGET_DEVICE)),)
PRODUCT_COPY_FILES += \
    vendor/choose-a/prebuilt/bootanimation/720p/bootanimation.zip:system/media/bootanimation.zip
else
PRODUCT_COPY_FILES += \
    vendor/choose-a/prebuilt/bootanimation/1080p/bootanimation.zip:system/media/bootanimation.zip
endif

# Snapdragon camera
PRODUCT_PACKAGES += \
    SnapdragonCamera

# DRM
PRODUCT_COPY_FILES +=  \
    vendor/choose-a/prebuilt/vendor/lib/mediadrm/libwvdrmengine.so:$(TARGET_COPY_OUT_VENDOR)/lib/mediadrm/libwvdrmengine.so \
    vendor/choose-a/prebuilt/vendor/bin/hw/android.hardware.drm@1.0-service.widevine:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.drm@1.0-service.widevine \
    vendor/choose-a/prebuilt/vendor/etc/init/android.hardware.drm@1.0-service.widevine.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/android.hardware.drm@1.0-service.widevine.rc \
    vendor/choose-a/prebuilt/vendor/lib/libwvhidl.so:$(TARGET_COPY_OUT_VENDOR)/lib/libwvhidl.so

# GSM APN list
PRODUCT_COPY_FILES += \
    vendor/choose-a/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# general properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.build.selinux=1 \
    persist.sys.disable_rescue=true

# Tethering - allow without requiring a provisioning app
# (for devices that check this)
PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/choose-a/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/choose-a/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/choose-a/prebuilt/bin/50-hosts.sh:system/addon.d/50-hosts.sh \
    vendor/choose-a/prebuilt/bin/blacklist:system/addon.d/blacklist

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/choose-a/prebuilt/etc/sysconfig/backup.xml:system/etc/sysconfig/backup.xml

# Add overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/choose-a/overlay/common

# SELinux
-include vendor/choose-a/sepolicy/sepolicy.mk

# Additional packages
-include vendor/choose-a/config/packages.mk

# Versioning
-include vendor/choose-a/config/version.mk

# Include optional extras
-include vendor/choose-a/config/gms.mk
