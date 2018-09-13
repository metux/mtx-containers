
TOPDIR :=..

include $(TOPDIR)/common/conf.mk

DOCKER_TAG ?= $(DOCKER_USER)/dng-thunderbird-build
AUTOGEN_SCRIPTS = skype

#AUTOGEN_SCRIPTS_LIST = $(addprefix scripts/,$(AUTOGEN_SCRIPTS))

build:	build-image build-scripts

build-scripts:	$(AUTOGEN_SCRIPTS_LIST)

build-image:
	$(DOCKER_BUILD) . -t $(DOCKER_TAG)

install:
	mkdir -p $(DESTDIR)/$(BINDIR)
	for s in $(SCRIPTS) ; do cp $$s $(DESTDIR)/$(BINDIR) ; chmod ugo+x $(DESTDIR)/$(BINDIR)/$$s ; done

clean:
#	rm -f $(AUTOGEN_SCRIPTS_LIST)
#	rmdir scripts || true

.PHONY: build build-scripts build-image install clean
