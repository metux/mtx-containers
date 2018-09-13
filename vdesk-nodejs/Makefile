
TOPDIR :=..

include $(TOPDIR)/common/conf.mk

IMAGE_NAME ?= vdesk-nodejs
AUTOGEN_SCRIPTS = skype

#AUTOGEN_SCRIPTS_LIST = $(addprefix scripts/,$(AUTOGEN_SCRIPTS))

build:	build-image build-scripts

build-scripts:	$(AUTOGEN_SCRIPTS_LIST)

build-image:
	$(DOCKER_BUILD) . -t $(DOCKER_TAG)

install:
	mkdir -p $(DESTDIR)/$(BINDIR)
	for s in $(SCRIPTS) ; do cp $$s $(DESTDIR)/$(BINDIR) ; chmod ugo+x $(DESTDIR)/$(BINDIR)/$$s ; done

#scripts/skype:	$(TOPDIR)/common/runscript.in
#	mkdir -p `dirname "$@"`
#	cat $< | sed -e 's~@CONTAINER_IMAGE@~$(DOCKER_TAG)~g; s~@CONTAINER_X11@~true~g;' > $@
#	chmod ugo+x $@

clean:
#	rm -f $(AUTOGEN_SCRIPTS_LIST)
#	rmdir scripts || true

.PHONY: build build-scripts build-image install clean
