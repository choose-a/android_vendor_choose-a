# Include some configs

include vendor/choose-a/config/BoardConfigKernel.mk
include vendor/choose-a/config/BoardConfigSoong.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/choose-a/config/BoardConfigQcom.mk
endif
