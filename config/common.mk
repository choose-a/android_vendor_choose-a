PRODUCT_BRAND ?= choose-a

# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/choose-a/prebuilt/bootanimation/1080/bootanimation.zip:system/media/bootanimation.zip

# general properties
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=1

# Additional packages
-include vendor/choose-a/config/packages.mk

# Versioning
-include vendor/choose-a/config/version.mk

