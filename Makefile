ARCHS = armv7 arm64
TARGET = iphone:clang: 9.3:7.0
GO_EASY_ON_ME = 1


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = StripNumberPad
StripNumberPad_FILES = Tweak.xm
StripNumberPad_PRIVATE_FRAMEWORKS = TelephonyUI

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 MobilePhone”
