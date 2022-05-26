include $(TOPDIR)/rules.mk


PKG_NAME:=qloader
PKG_VERSION:=1.0.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/fengmushu/qloader.git
PKG_SOURCE_VERSION:=f33b5037fa63f18ec5495e1fa1cf03733cf52e40
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_SOURCE_VERSION)
PKG_SOURCE:=$(PKG_SOURCE_SUBDIR).tar.xz

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)
PKG_MAINTAINER:=martin.ken <martin@tt-cool.com>

include $(INCLUDE_DIR)/package.mk

ifeq ($(CONFIG_BIG_ENDIAN),y)
TARGET_CFLAGS+= -DHAVE_BIG_ENDIAN=1
endif
TARGET_CFLAGS+= -D_GNU_SOURCE

define Package/qloader
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Quectel Spreadtrum Firmware downloader
  URL:=http://tools.rm500u.com/
  DEPENDS:=
endef

define Package/qloader/description
  Quectel RM500U FOTA from CPE linux system;
endef

# Nothing just to be sure
# define Build/Configure
# endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/qdloader/ \
		$(TARGET_CONFIGURE_OPTS) \
		TARGET=Linux \
		CFLAGS="$(TARGET_CFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)"
endef

define Package/qloader/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/qdloader/qdloader $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,qloader))
