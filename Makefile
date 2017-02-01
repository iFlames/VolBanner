TARGET = iphone:latest:8.4
ARCHS = armv7 arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = VolBanner
VolBanner_FILES = Tweak.xm
VolBanner_FRAMEWORKS = UIKit CoreGraphics
VolBanner_LIBRARIES += cephei

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += volbannerprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
