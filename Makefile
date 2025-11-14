VERSION = 0.1
PREFIX ?= /usr
WALLPAPERS := $(wildcard */)
DEST := $(DESTDIR)$(PREFIX)/share/rysn-wallpapers

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
	mkdir -p ${DEST}/share/rysn-wallpapers
	$(foreach w,$(WALLPAPERS),\
		@echo "Copying $(w)"; \
		@cp $(w) $(DEST);)
	chmod -R 655 ${DEST}/share/rysn-wallpapers

uninstall:
	rm -fr ${DEST}/share/rysn-wallpapers

.PHONY: all install uninstall
