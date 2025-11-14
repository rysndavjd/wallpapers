VERSION = 0.1
PREFIX ?= /usr
DIRS := $(wildcard */)

all: options install

options:
	@echo Wallpapers options:
	@echo "PREFIX = ${PREFIX}"
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
	mkdir -p ${DESTDIR}${PREFIX}/share/rysn-wallpapers
	@for w in ./*/*; do \
    	echo "Copying $$w"; \
		cp $$w ${DESTDIR}${PREFIX}/share/rysn-wallpapers/; \
	done
	chmod -R 655 ${DESTDIR}${PREFIX}/share/rysn-wallpapers

uninstall:
	rm -fr ${DESTDIR}${PREFIX}/share/rysn-wallpapers

.PHONY: all install uninstall
