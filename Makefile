VERSION = 0.1
PREFIX ?= /usr
INSTALLDIR = ${DESTDIR}${PREFIX}/share/rysn-wallpapers
DIRS := $(wildcard */)

all: options install

options:
	@echo Wallpapers options:
	@echo "PREFIX = ${PREFIX}"
	@echo "INSTALLDIR  = ${INSTALLDIR}"
	@echo ""

clean:
	rm -rf rysn-wallpapers-${VERSION}.tar.gz

release: clean
	mkdir -p rysn-wallpapers-${VERSION}
	cp -R LICENSE Makefile ${DIRS} ./rysn-wallpapers-${VERSION}
	tar -cf rysn-wallpapers-${VERSION}.tar rysn-wallpapers-${VERSION}
	gzip rysn-wallpapers-${VERSION}.tar
	rm -rf rysn-wallpapers-${VERSION}

install:
	mkdir -p ${INSTALLDIR}
	@for w in ./*/*; do \
    	echo "Copying $$w"; \
		cp $$w ${INSTALLDIR}/; \
	done
	chmod -R 655 ${INSTALLDIR}

uninstall:
	rm -fr ${INSTALLDIR}

.PHONY: all install uninstall
