VENDOR_CHOOSE_PATH := vendor/choose-a

# Permissions Google Apps
PRODUCT_COPY_FILES += \
    vendor/choose-a/prebuilt/etc/permissions/privapp-permissions-elgoog.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-elgoog.xml \
    vendor/choose-a/prebuilt/etc/permissions/privapp-permissions-choose.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-choose.xml

# Google property overides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.setupwizard.rotation_locked=true

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# Audio (Notifications/Alarms)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.notification_sound=Tethys.ogg \
    ro.config.alarm_alert=Oxygen.ogg \
    ro.config.ringtone=Orion.ogg

# Google Assistant
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opa.eligible_device=true

# OpenGapps
GAPPS_VARIANT := mini
GAPPS_FORCE_PACKAGE_OVERRIDES := true
GAPPS_FORCE_WEBVIEW_OVERRIDES := true
GAPPS_FORCE_BROWSER_OVERRIDES := true
GAPPS_FORCE_PIXEL_LAUNCHER := true
GAPPS_FORCE_DIALER_OVERRIDES := true
GAPPS_FORCE_MMS_OVERRIDES := true

# Plus mini
PRODUCT_PACKAGES += \
    CalculatorGoogle \
    GoogleContacts \
    GoogleExtServices \
    GoogleExtShared \
    GooglePrintRecommendationService \
    LatinImeGoogle \
    Music2 \
    Photos \
    PrebuiltDeskClockGoogle \
    TagGoogle

GAPPS_EXCLUDED_PACKAGES := GoogleCamera

$(call inherit-product-if-exists, vendor/opengapps/build/opengapps-packages.mk)
