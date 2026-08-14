#!/bin/sh

cd wine-aqua

WINE_LIBS=/opt/stuff/wine/libs/target-x86
WINE_PATH=/opt/stuff/wine/target-x86

PATH=${WINE_LIBS}/bin:${PATH}

./configure \
CC="clang -arch x86_64" \
CXX="clang++ -arch x86_64" \
CFLAGS="-I${WINE_LIBS}/include" \
LDFLAGS="-L${WINE_LIBS}/lib -Wl,-rpath,${WINE_LIBS}/lib" \
--build="x86_64-apple-darwin" \
--prefix=${WINE_PATH} \
--disable-tests \
--disable-win16 \
--disable-winebth_sys \
--disable-winemenubuilder \
--enable-archs=i386,x86_64 \
--with-mingw=clang \
--with-coreaudio \
--with-freetype \
--with-gnutls \
--with-mingw \
--with-gstreamer \
--with-sdl \
--with-gettext \
--with-pthread \
--with-vulkan \
--with-ffmpeg \
--with-inotify \
--without-opengl \
--without-pcap \
--without-pcsclite \
--without-alsa \
--without-capi \
--without-cups \
--without-dbus \
--without-fontconfig \
--without-gettextpo \
--without-gphoto \
--without-gssapi \
--without-krb5 \
--without-netapi \
--without-opencl \
--without-oss \
--without-pulse \
--without-sane \
--without-udev \
--without-usb \
--without-v4l2 \
--without-wayland \
--without-x

PROCS="$(sysctl -n hw.ncpu 2>/dev/null)"
make -j $PROCS && make install
