
include ../common/conf.mk

DOCKER_TAG   ?= $(DOCKER_USER)/vdesk-alpine-texlive

SCRIPTS = pdflatex

build:
	$(DOCKER_BUILD) . -t $(DOCKER_TAG)

install:
	mkdir -p $(DESTDIR)/$(BINDIR)
	for s in $(SCRIPTS) ; do cp $$s $(DESTDIR)/$(BINDIR) ; chmod ugo+x $(DESTDIR)/$(BINDIR)/$$s ; done
