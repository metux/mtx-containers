TOPDIR			:= ../../
IMAGE_NAME		:= vdesk-chromium-ascii
AUTOGEN_SCRIPT		:= vdesk-chromium
CONTAINER_X11		:= yes
CONTAINER_DRI		:= yes
CONTAINER_NAME		:= vdesk-chromium-ascii

DOCKER_DEPS		:= prepare

include $(TOPDIR)/common/std.mk

prepare:
	rm -Rf autogen
	mkdir -p autogen
	cp ../files/* autogen/
