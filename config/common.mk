PRODUCT_BRAND ?= choose-a

# general properties
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=1

# Additional packages
-include vendor/choose-a/config/packages.mk

# Versioning
-include vendor/choose-a/config/version.mk

