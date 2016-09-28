.PHONY: install

VERSION=6.5.5
PREFIX=/usr/local
ARCHIVE=$(PREFIX)/src/global.tar.gz
SRCDIR=$(PREFIX)/src/global-$(VERSION)
MAKEFILE=$(SRCDIR)/Makefile
GLOBAL_BIN=$(SRCDIR)/global/global
GTAGS_BIN=$(SRCDIR)/gtags/gtags

URL="http://tamacom.com/global/global-${VERSION}.tar.gz"

all: $(ARCIVE) $(SRCDIR) $(MAKEFILE) $(GLOBAL_BIN) $(GTAGS_BIN) install

$(ARCHIVE): .download
	curl -o $(ARCHIVE) $(URL)

$(SRCDIR): $(ARCHIVE)
	cd $(PREFIX)/src && tar xvf $(ARCHIVE)
	touch $(SRCDIR)
	touch $(SRCDIR)/configure

$(MAKEFILE): $(SRCDIR)/configure
	cd $(SRCDIR) && ./configure
	echo $(MAKEFILE)

$(GLOBAL_BIN) $(GTAGS_BIN): $(MAKEFILE)
	cd $(SRCDIR) && make

install:
	\cp -pf $(GLOBAL_BIN) $(PREFIX)/bin
	\cp -pf $(GTAGS_BIN) $(PREFIX)/bin
