arch_triplet := $(shell dpkg-architecture -q DEB_TARGET_MULTIARCH)

define QT5_CONF
./usr/lib/$(arch_triplet)/qt5/bin
./usr/lib/$(arch_triplet)
endef
export QT5_CONF

define FONT_CONF
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<!-- /etc/fonts/fonts.conf file to configure system font access -->
<fontconfig>
  <!-- The xdg prefix will be replaced by XDG_DATA_HOME -->
  <dir prefix="xdg">fonts</dir>
  <cachedir prefix="xdg">fontconfig</cachedir>
</fontconfig>
endef
export FONT_CONF

all:

build:
	@echo "$$QT5_CONF" > snappy-qt5.conf
	@echo "$$FONT_CONF" > local.conf
		
install: build
	install -D -m644 snappy-qt5.conf \
		$(DESTDIR)/etc/xdg/qtchooser/snappy-qt5.conf
	install -D -m755 qt5-launch $(DESTDIR)/bin/qt5-launch
	install -D -m644 local.conf \
		$(DESTDIR)/etc/fonts/local.conf
