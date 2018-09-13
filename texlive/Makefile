
DOCKER       ?= docker
DOCKER_BUILD ?= $(DOCKER) build
DOCKER_RUN   ?= $(DOCKER) run
DOCKER_TAG   ?= metux/vdesk-texlive

PREFIX ?= /usr
BINDIR ?= $(PREFIX)/bin

SCRIPTS = pdflatex

build:
	$(DOCKER_BUILD) . -t $(DOCKER_TAG)

install:
	mkdir -p $(DESTDIR)/$(BINDIR)
	for s in $(SCRIPTS) ; do cp $$s $(DESTDIR)/$(BINDIR) ; chmod ugo+x $(DESTDIR)/$(BINDIR)/$$s ; done
