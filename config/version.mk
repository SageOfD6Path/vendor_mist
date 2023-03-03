PRODUCT_VERSION_MAJOR = 20
PRODUCT_VERSION_MINOR = 0

ifeq ($(MIST_VERSION_APPEND_TIME_OF_DAY),true)
    MIST_BUILD_DATE := $(shell date -u +%Y%m%d_%H%M%S)
else
    MIST_BUILD_DATE := $(shell date -u +%Y%m%d)
endif

# Set MIST_BUILDTYPE from the env RELEASE_TYPE, for jenkins compat

ifndef MIST_BUILDTYPE
    ifdef RELEASE_TYPE
        # Starting with "MIST_" is optional
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^MIST_||g')
        MIST_BUILDTYPE := $(RELEASE_TYPE)
    endif
endif

# Filter out random types, so it'll reset to UNOFFICIAL
ifeq ($(filter RELEASE NIGHTLY SNAPSHOT EXPERIMENTAL,$(MIST_BUILDTYPE)),)
    MIST_BUILDTYPE := UNOFFICIAL
    MIST_EXTRAVERSION :=
endif

ifeq ($(MIST_BUILDTYPE), UNOFFICIAL)
    ifneq ($(TARGET_UNOFFICIAL_BUILD_ID),)
        MIST_EXTRAVERSION := -$(TARGET_UNOFFICIAL_BUILD_ID)
    endif
endif

MIST_VERSION_SUFFIX := $(MIST_BUILD_DATE)-$(MIST_BUILDTYPE)$(MIST_EXTRAVERSION)-$(MIST_BUILD)

# Internal version
MIST_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(MIST_VERSION_SUFFIX)

# Display version
MIST_DISPLAY_VERSION := $(PRODUCT_VERSION_MAJOR)-$(MIST_VERSION_SUFFIX)
