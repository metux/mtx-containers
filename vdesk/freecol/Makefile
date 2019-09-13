TOPDIR			:= ../../
IMAGE_NAME		:= vdesk-freecol-testing
AUTOGEN_SCRIPT		:= vdesk-freecol
CONTAINER_NAME		:= vdesk-freecol-testing
CONTAINER_X11		:= yes
CONTAINER_DRI		:= yes

DOCKER_DEPS		:= prepare

include $(TOPDIR)/common/std.mk

prepare:
	rm -Rf autogen
	mkdir -p autogen
	cp ../files/* autogen/
