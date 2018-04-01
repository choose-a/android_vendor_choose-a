VENDOR_CHOOSE_PATH := vendor/choose-a


# DRM
PRODUCT_COPY_FILES +=  \
    $(VENDOR_CHOOSE_PATH)/prebuilt/common/vendor/bin/hw/android.hardware.drm@1.0-service.widevine:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.drm@1.0-service.widevine \
    $(VENDOR_CHOOSE_PATH)/prebuilt/common/vendor/etc/init/android.hardware.drm@1.0-service.widevine.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/android.hardware.drm@1.0-service.widevine.rc \
    $(VENDOR_CHOOSE_PATH)/prebuilt/common/vendor/lib/libwvhidl.so:$(TARGET_COPY_OUT_VENDOR)/lib/libwvhidl.so
