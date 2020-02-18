# Apply it to build.prop
ADDITIONAL_BUILD_PROPERTIES += \
    ro.modversion=Choose-A-Rom-$(CHOOSE_VERSION) \
    ro.choose-a.version=$(CHOOSE_VERSION) \
    ro.romstats.url=https://stats.choose-a.name \
    ro.romstats.name=Choose-A-Rom \
    ro.romstats.version=$(CHOOSE_VERSION)

# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif
