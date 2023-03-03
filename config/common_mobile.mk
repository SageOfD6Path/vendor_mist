# Inherit common mobile Mist stuff
$(call inherit-product, vendor/mist/config/common.mk)

# Apps
PRODUCT_PACKAGES += \
    Aperture \
    Etar \
    Email \
    ExactCalculator \
    Exchange2 \
    Seedvault

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet
