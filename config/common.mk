PRODUCT_BRAND ?= choose-a

# Bootanimation
ifneq ($(filter kugo lilac,$(TARGET_DEVICE)),)
PRODUCT_COPY_FILES += \
    vendor/choose-a/prebuilt/bootanimation/720p/bootanimation.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
else
PRODUCT_COPY_FILES += \
    vendor/choose-a/prebuilt/bootanimation/1080p/bootanimation.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
endif

# Copy changelog
PRODUCT_COPY_FILES += \
    vendor/choose-a/prebuilt/etc/Changelog.txt:system/etc/Changelog.txt

# Snapdragon gallery
PRODUCT_PACKAGES += \
    SnapdragonGallery

# GSM APN list
PRODUCT_COPY_FILES += \
    vendor/choose-a/prebuilt/etc/apns-conf.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/apns-conf.xml

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
    vendor/choose-a/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/choose-a/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/choose-a/prebuilt/bin/50-hosts.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-hosts.sh \
    vendor/choose-a/prebuilt/bin/blacklist:$(TARGET_COPY_OUT_SYSTEM)/addon.d/blacklist

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/choose/prebuilt/bin/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    vendor/choose/prebuilt/bin/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    vendor/choose/prebuilt/bin/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh
endif

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/choose-a/prebuilt/etc/sysconfig/backup.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/backup.xml

# Add overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/choose-a/overlay

# Enable SIP and VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.sip.voip.xml

# SELinux
-include vendor/choose-a/sepolicy/sepolicy.mk

# Additional packages
-include vendor/choose-a/config/packages.mk

# Opengapps and Google properties
-include vendor/choose-a/config/gms.mk

# Versioning
-include vendor/choose-a/config/version.mk

