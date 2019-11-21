ARCHS = arm64 arm64e
TARGET = iphone:clang:11.2:11.2

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Tick

Tick_FILES = Tweak.x
Tick_CFLAGS = -fobjc-arc
$(TWEAK_NAME)_FRAMEWORKS += UIKit AudioToolbox
$(TWEAK_NAME)_EXTRA_FRAMEWORKS += Cephei

include $(THEOS_MAKE_PATH)/tweak.mk
