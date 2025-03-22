#!/bin/sh

cd wine-aqua

WINE_LIBS=/opt/stuff/wine/libs/target

PATH=${WINE_LIBS}/bin:${PATH}

./configure \
CC="clang -arch x86_64" \
CXX="clang++ -arch x86_64" \
CFLAGS="-I${WINE_LIBS}/include" \
LDFLAGS="-L${WINE_LIBS}/lib -Wl,-rpath,${WINE_LIBS}/lib" \
--build="x86_64-apple-darwin" \
--prefix=/opt/stuff/wine/target \
--disable-tests \
--disable-win16 \
--enable-archs=i386,x86_64 \
--with-coreaudio \
--with-freetype \
--with-gnutls \
--with-mingw \
--with-gstreamer \
--with-ffmpeg \
--with-sdl \
--with-gettext \
--with-pthread \
--with-vulkan \
--with-opengl \
--with-unwind \
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
--without-inotify \
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
