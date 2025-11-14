VERSION = 0.1
PREFIX ?= /usr

all: options install

options:
	@echo Wallpapers options:
	@echo "PREFIX = ${PREFIX}"
	@echo ""

clean:
	rm -rf rysn-wallpapers-${VERSION}.tar.gz

release: clean
	mkdir -p rysn-wallpapers-${VERSION}
	cp -R LICENSE Makefile *.png ./rysn-wallpapers-${VERSION}
	tar -cf rysn-wallpapers-${VERSION}.tar rysn-wallpapers-${VERSION}
	gzip rysn-wallpapers-${VERSION}.tar
	rm -rf rysn-wallpapers-${VERSION}

install:
	mkdir -p $(DESTDIR)$(PREFIX)/share/rysn-wallpapers
	cp -fr *.png $(DESTDIR)$(PREFIX)/share/rysn-wallpapers/
	chmod -R 655 $(DESTDIR)$(PREFIX)/share/rysn-wallpapers

uninstall:
	rm -fr ${DEST}/share/rysn-wallpapers

.PHONY: all install uninstall
