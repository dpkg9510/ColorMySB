export ARCHS = arm64 arm64e
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = ColorMySB
ColorMySB_FILES = csbRootListController.m
ColorMySB_INSTALL_PATH = /Library/PreferenceBundles
ColorMySB_FRAMEWORKS = UIKit
ColorMySB_PRIVATE_FRAMEWORKS = Preferences
ColorMySB_EXTRA_FRAMEWORKS = Cephei CepheiPrefs
ColorMySB_CFLAGS = -fobjc-arc
include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/ColorMySB.plist$(ECHO_END)
