# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# ProjectMist System Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.mist.version=$(MIST_VERSION) \
    ro.mist.releasetype=$(MIST_BUILDTYPE) \
    ro.mist.build.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.modversion=$(MIST_VERSION) \
    ro.mistlegal.url=https://projectmist.org/legal

# ProjectMist Platform Display Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.mist.display.version=$(MIST_DISPLAY_VERSION)

# ProjectMist Platform SDK Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.mist.build.version.plat.sdk=$(MIST_PLATFORM_SDK_VERSION)

# ProjectMist Platform Internal Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.mist.build.version.plat.rev=$(MIST_PLATFORM_REV)
