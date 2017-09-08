PRODUCT_BRAND ?= choose-a

# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/choose-a/prebuilt/bootanimation/1080/bootanimation.zip:system/media/bootanimation.zip

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
    persist.sys.root_access=1

# enable ADB authentication if not on eng build
ifneq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES  += ro.adb.secure=1
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/choose-a/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/choose-a/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/choose-a/prebuilt/bin/50-hosts.sh:system/addon.d/50-hosts.sh \
    vendor/choose-a/prebuilt/bin/blacklist:system/addon.d/blacklist

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/choose-a/prebuilt/etc/sysconfig/backup.xml:system/etc/sysconfig/backup.xml

# Enable SIP and VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# custom omni sounds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=omni_ringtone1.ogg \
    ro.config.notification_sound=omni_notification1.ogg \
    ro.config.alarm_alert=omni_alarm1.ogg

PRODUCT_COPY_FILES += \
    vendor/choose-a/prebuilt/sounds/camera_click_48k.ogg:system/media/audio/ui/camera_click.ogg \
    vendor/choose-a/prebuilt/sounds/VideoRecord_48k.ogg:system/media/audio/ui/VideoRecord.ogg \
    vendor/choose-a/prebuilt/sounds/VideoStop_48k.ogg:system/media/audio/ui/VideoStop.ogg \
    vendor/choose-a/prebuilt/sounds/omni_ringtone1.ogg:system/media/audio/ringtones/omni_ringtone1.ogg \
    vendor/choose-a/prebuilt/sounds/omni_ringtone2.ogg:system/media/audio/ringtones/omni_ringtone2.ogg \
    vendor/choose-a/prebuilt/sounds/omni_ringtone3.ogg:system/media/audio/ringtones/omni_ringtone3.ogg \
    vendor/choose-a/prebuilt/sounds/omni_alarm1.ogg:system/media/audio/alarms/omni_alarm1.ogg \
    vendor/choose-a/prebuilt/sounds/omni_alarm2.ogg:system/media/audio/alarms/omni_alarm2.ogg \
    vendor/choose-a/prebuilt/sounds/omni_notification1.ogg:system/media/audio/notifications/omni_notification1.ogg \
    vendor/choose-a/prebuilt/sounds/omni_lowbattery1.ogg:system/media/audio/ui/omni_lowbattery1.ogg \
    vendor/choose-a/prebuilt/sounds/omni_lock_phone.ogg:system/media/audio/ui/omni_lock_phone.ogg \
    vendor/choose-a/prebuilt/sounds/omni_unlock_phone.ogg:system/media/audio/ui/omni_unlock_phone.ogg

# Additional packages
-include vendor/choose-a/config/packages.mk

# Versioning
-include vendor/choose-a/config/version.mk

# Add our overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/choose-a/overlay/common

# Enable dexpreopt for all nightlies
ifeq ($(ROM_BUILDTYPE),NIGHTLY)
    ifeq ($(WITH_DEXPREOPT),)
        WITH_DEXPREOPT := true
    endif
endif
# and weeklies
ifeq ($(ROM_BUILDTYPE),WEEKLY)
    ifeq ($(WITH_DEXPREOPT),)
        WITH_DEXPREOPT := true
    endif
endif
# and security releases
ifeq ($(ROM_BUILDTYPE),SECURITY_RELEASE)
    ifeq ($(WITH_DEXPREOPT),)
        WITH_DEXPREOPT := true
    endif
endif
# but not homemades
ifeq ($(ROM_BUILDTYPE),HOMEMADE)
    WITH_DEXPREOPT := false
endif
