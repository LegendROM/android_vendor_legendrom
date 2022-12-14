include vendor/legendrom/config/BoardConfigSoong.mk
include vendor/legendrom/config/BoardConfigQcom.mk
include vendor/legendrom/build/core/pathmap.mk

TARGET_SYSTEM_PROP += \
    vendor/legendrom/config/system.prop

DEVICE_PACKAGE_OVERLAYS += vendor/legendrom/overlay

# Styles & wallpapers
PRODUCT_COPY_FILES += \
    vendor/legendrom/config/permissions/privapp_whitelist_com.android.wallpaper.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp_whitelist_com.android.wallpaper.xml \
    vendor/legendrom/config/permissions/default_com.android.wallpaper.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/default-permissions/default_com.android.wallpaper.xml

# Custom init.rc with all the instructions that needs to be run from the system partition
PRODUCT_COPY_FILES += \
    vendor/legendrom/prebuilt/init.aosp.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/init.aosp.rc

# Custom init.rc with instructions that needs to be run from the vendor partition
PRODUCT_COPY_FILES += \
    vendor/legendrom/prebuilt/init.vendor.aosp.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.vendor.aosp.rc

# Prebuilt kernel
PRODUCT_COPY_FILES += \
    kernel/oneplus/prebuilt/Image.gz-dtb:kernel

# Init rc files for recovery
PRODUCT_COPY_FILES += \
    vendor/legendrom/config/recovery/root/init.recovery.qcom.rc:root/init.recovery.qcom.rc \
    vendor/legendrom/config/recovery/root/init.recovery.qcom.usb.rc:root/init.recovery.qcom.usb.rc

include device/lineage/sepolicy/common/sepolicy.mk
BOARD_SEPOLICY_DIRS += vendor/legendrom/sepolicy

SKIP_BOOT_JARS_CHECK := true

# Explicitly disable AVB
BOARD_AVB_ENABLE := false

# Used to avoid getting errors for stuff we are not actually building
# Remove when and if possible
ALLOW_MISSING_DEPENDENCIES := true

# Allow include prebuilt binaries as on A11
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Allow building with broken sysprop SELinux policies
BUILD_BROKEN_ENFORCE_SYSPROP_OWNER := true

# Recovery
TARGET_RECOVERY_UI_LIB := librecovery_ui_custom

# Power
TARGET_TAP_TO_WAKE_NODE := "/proc/touchpanel/double_tap_enable"
TARGET_USES_INTERACTION_BOOST := true

# Disable extended compress format
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := false

# VINTF
DEVICE_MANIFEST_FILE += vendor/legendrom/config/vintf/android.hardware.vibrator_v1.0.xml
