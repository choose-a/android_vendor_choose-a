PRODUCT_BRAND ?= choose-a

# Bootanimation
ifneq ($(filter kugo lilac,$(TARGET_DEVICE)),)
PRODUCT_COPY_FILES += \
    vendor/choose-a/prebuilt/bootanimation/720p/bootanimation.zip:system/media/bootanimation.zip
else
PRODUCT_COPY_FILES += \
    vendor/choose-a/prebuilt/bootanimation/1080p/bootanimation.zip:system/media/bootanimation.zip
endif

# DRM
PRODUCT_COPY_FILES +=  \
    vendor/choose-a/prebuilt/vendor/bin/move_widevine_data.sh:$(TARGET_COPY_OUT_VENDOR)/bin/move_widevine_data.sh \
    vendor/choose-a/prebuilt/vendor/bin/hw/android.hardware.drm@1.1-service.widevine:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.drm@1.1-service.widevine \
    vendor/choose-a/prebuilt/vendor/etc/init/android.hardware.drm@1.1-service.widevine.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/android.hardware.drm@1.1-service.widevine.rc \
    vendor/choose-a/prebuilt/vendor/lib/libwvhidl.so:$(TARGET_COPY_OUT_VENDOR)/lib/libwvhidl.so

# GSM APN list
PRODUCT_COPY_FILES += \
    vendor/choose-a/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# general properties
PRODUCT_PROPERTY_OVERRIDES += \
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
PRODUCT_PACKAGE_OVERLAYS += vendor/choose-a/overlay

# Enable SIP and VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# SELinux
-include vendor/choose-a/sepolicy/sepolicy.mk

# Additional packages
-include vendor/choose-a/config/packages.mk

# Opengapps and Google properties
-include vendor/choose-a/config/gms.mk

# Versioning
-include vendor/choose-a/config/version.mk

