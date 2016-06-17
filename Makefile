arch_triplet := $(shell dpkg-architecture -q DEB_TARGET_MULTIARCH)

define QT5_CONF
./usr/lib/$(arch_triplet)/qt5/bin
./usr/lib/$(arch_triplet)
endef
export QT5_CONF

all:

build:
	@echo "$$QT5_CONF" > snappy-qt5.conf
		
install: build
	install -D -m644 snappy-qt5.conf \
		$(DESTDIR)/etc/xdg/qtchooser/snappy-qt5.conf
	install -D -m755 qt5-launch $(DESTDIR)/bin/qt5-launch
