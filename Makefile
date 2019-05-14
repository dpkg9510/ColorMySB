DEBUG = 0
export ARCHS = arm64 arm64e
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ColorMySB
ColorMySB_FILES = Tweak.xm
ColorMySB_CFLAGS = -fobjc-arc
include $(THEOS_MAKE_PATH)/tweak.mk
THEOS_PLATFORM_DEB_COMPRESSION_LEVEL = 6
after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += colormysb
include $(THEOS_MAKE_PATH)/aggregate.mk
