VENDOR_CHOOSE_PATH := vendor/choose-a

# Google property overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.control_privapp_permissions=enforce \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.setupwizard.rotation_locked=true

# Include overlays
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/choose-a/overlay

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

# Override stock AOSP apps
PRODUCT_PACKAGES += \
    GoogleCamera \
    GoogleContacts \
    LatinImeGoogle \
    Music2 \
    TagGoogle

# Snapdragon camera
TW_USE_TOOLBOX := true

PRODUCT_PACKAGES += \
    SnapdragonCamera

# DRM
PRODUCT_COPY_FILES +=  \
    $(VENDOR_CHOOSE_PATH)/prebuilt/common/vendor/bin/hw/android.hardware.drm@1.0-service.widevine:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.drm@1.0-service.widevine \
    $(VENDOR_CHOOSE_PATH)/prebuilt/common/vendor/etc/init/android.hardware.drm@1.0-service.widevine.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/android.hardware.drm@1.0-service.widevine.rc \
    $(VENDOR_CHOOSE_PATH)/prebuilt/common/vendor/lib/libwvhidl.so:$(TARGET_COPY_OUT_VENDOR)/lib/libwvhidl.so

$(call inherit-product-if-exists, vendor/opengapps/build/opengapps-packages.mk)
