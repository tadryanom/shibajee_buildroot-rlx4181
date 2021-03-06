################################################################################
#
# xlib_libXpm
#
################################################################################

XLIB_LIBXPM_VERSION = 3.5.13
XLIB_LIBXPM_SOURCE = libXpm-$(XLIB_LIBXPM_VERSION).tar.bz2
XLIB_LIBXPM_SITE = http://xorg.freedesktop.org/releases/individual/lib
XLIB_LIBXPM_LICENSE = MIT
XLIB_LIBXPM_LICENSE_FILES = COPYING COPYRIGHT
XLIB_LIBXPM_INSTALL_STAGING = YES
XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xorgproto \
	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
	$(TARGET_NLS_DEPENDENCIES)
XLIB_LIBXPM_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)

ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
XLIB_LIBXPM_CONF_ENV += ac_cv_search_gettext=no
endif

$(eval $(autotools-package))
