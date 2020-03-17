# Additional apps
PRODUCT_PACKAGES += \
    MonthCalendarWidget \
    MusicFX \
    OpenDelta \
    Stk

# Additional tools
PRODUCT_PACKAGES += \
    bash \
    e2fsck \
    htop \
    lsof \
    mke2fs \
    mkshrc_vendor \
    nano \
    powertop \
    rsync \
    sh_vendor \
    toybox_vendor \
    tune2fs \
    vim \
    zip

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# Utils
PRODUCT_PACKAGES += \
    choose-util

# Telephony extension
PRODUCT_PACKAGES += telephony-ext
PRODUCT_BOOT_JARS += telephony-ext
