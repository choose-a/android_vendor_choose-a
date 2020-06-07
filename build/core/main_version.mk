# Apply it to build.prop
ADDITIONAL_BUILD_PROPERTIES += \
    ro.modversion=Choose-A-Rom-$(CHOOSE_VERSION) \
    ro.choose.version=$(CHOOSE_VERSION) \

# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif
