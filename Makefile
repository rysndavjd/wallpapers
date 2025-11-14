PREFIX ?= /usr
INSTALLDIR = ${DESTDIR}${PREFIX}/share/rysn-wallpapers

all: options install

options:
	@echo Wallpapers options:
	@echo "PREFIX = ${PREFIX}"
	@echo "INSTALLDIR  = ${INSTALLDIR}"
	@echo ""

install:
	mkdir -p ${INSTALLDIR}
	@for w in */*; do \
    	echo "Copying $$w"; \
		cp $$w ${INSTALLDIR}/; \
	done
	chmod -R 655 ${INSTALLDIR}

uninstall:
	rm -fr ${INSTALLDIR}

.PHONY: all install uninstall
